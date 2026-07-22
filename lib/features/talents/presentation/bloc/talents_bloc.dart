import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../resume/data/models/resume.dart';
import '../../domain/repositories/talents_repository.dart';

abstract class TalentsEvent {}

class LoadTalents extends TalentsEvent {}

class TalentsState {
  final bool isLoading;
  final List<Resume>? talents;
  final String? error;

  TalentsState({
    this.isLoading = false,
    this.talents,
    this.error,
  });

  TalentsState copyWith({
    bool? isLoading,
    List<Resume>? talents,
    String? error,
  }) {
    return TalentsState(
      isLoading: isLoading ?? this.isLoading,
      talents: talents ?? this.talents,
      error: error,
    );
  }
}

@injectable
class TalentsBloc extends Bloc<TalentsEvent, TalentsState> {
  final TalentsRepository _talentsRepository;

  TalentsBloc(this._talentsRepository) : super(TalentsState()) {
    on<LoadTalents>(_onLoad);
  }

  Future<void> _onLoad(LoadTalents event, Emitter<TalentsState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));
    final result = await _talentsRepository.getTalentFeed();
    
    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, error: failure.message)),
      (talents) => emit(state.copyWith(isLoading: false, talents: talents)),
    );
  }
}
