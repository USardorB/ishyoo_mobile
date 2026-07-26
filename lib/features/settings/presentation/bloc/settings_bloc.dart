import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/settings_repository.dart';
import '../../data/models/user_settings.dart';

abstract class SettingsEvent {}

class LoadSettings extends SettingsEvent {}

class UpdateNotificationSettings extends SettingsEvent {
  final Map<String, dynamic> body;
  UpdateNotificationSettings(this.body);
}

class SettingsState {
  final bool isLoading;
  final UserSettings? settings;
  final String? error;

  SettingsState({
    this.isLoading = false,
    this.settings,
    this.error,
  });

  SettingsState copyWith({
    bool? isLoading,
    UserSettings? settings,
    String? error,
  }) {
    return SettingsState(
      isLoading: isLoading ?? this.isLoading,
      settings: settings ?? this.settings,
      error: error,
    );
  }
}

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository _settingsRepository;

  SettingsBloc(this._settingsRepository) : super(SettingsState()) {
    on<LoadSettings>(_onLoad);
    on<UpdateNotificationSettings>(_onUpdateSettings);
  }

  Future<void> _onLoad(LoadSettings event, Emitter<SettingsState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _settingsRepository.getCandidateSettings();
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (settings) => emit(state.copyWith(isLoading: false, settings: settings)),
    );
  }

  Future<void> _onUpdateSettings(
    UpdateNotificationSettings event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _settingsRepository.updateCandidateSettings(
      event.body,
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(isLoading: false, error: failure.message)),
      (updatedSettings) {
        // Optimistically update the settings if needed, or simply reload.
        // For simplicity, we just reload the settings.
        add(LoadSettings());
      },
    );
  }
}
