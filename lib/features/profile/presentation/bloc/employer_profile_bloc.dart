import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/profile.dart';
import '../../domain/repositories/profile_repository.dart';

// --- EVENTS ---
abstract class EmployerProfileEvent {}

class LoadEmployerProfile extends EmployerProfileEvent {}

class UpdateEmployerProfileData extends EmployerProfileEvent {
  final Map<String, dynamic> body;
  UpdateEmployerProfileData(this.body);
}

// --- STATE ---
class EmployerProfileState {
  final bool isLoading;
  final bool isUpdating;
  final bool isUpdateSuccess;
  final Profile? profile;
  final String? error;

  EmployerProfileState({
    this.isLoading = false,
    this.isUpdating = false,
    this.isUpdateSuccess = false,
    this.profile,
    this.error,
  });

  EmployerProfileState copyWith({
    bool? isLoading,
    bool? isUpdating,
    bool? isUpdateSuccess,
    Profile? profile,
    String? error,
  }) {
    return EmployerProfileState(
      isLoading: isLoading ?? this.isLoading,
      isUpdating: isUpdating ?? this.isUpdating,
      isUpdateSuccess: isUpdateSuccess ?? this.isUpdateSuccess,
      profile: profile ?? this.profile,
      error: error,
    );
  }
}

// --- BLOC ---
@injectable
class EmployerProfileBloc extends Bloc<EmployerProfileEvent, EmployerProfileState> {
  final ProfileRepository _profileRepository;

  EmployerProfileBloc(this._profileRepository) : super(EmployerProfileState()) {
    on<LoadEmployerProfile>(_onLoad);
    on<UpdateEmployerProfileData>(_onUpdate);
  }

  Future<void> _onLoad(LoadEmployerProfile event, Emitter<EmployerProfileState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _profileRepository.getEmployerProfile();
    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, error: failure.message)),
      (profile) => emit(state.copyWith(isLoading: false, profile: profile)),
    );
  }

  Future<void> _onUpdate(UpdateEmployerProfileData event, Emitter<EmployerProfileState> emit) async {
    emit(state.copyWith(isUpdating: true, error: null));
    final result = await _profileRepository.updateEmployerProfile(event.body);
    result.fold(
      (failure) => emit(state.copyWith(isUpdating: false, error: failure.message)),
      (profile) => emit(state.copyWith(isUpdating: false, isUpdateSuccess: true, profile: profile)),
    );
  }
}
