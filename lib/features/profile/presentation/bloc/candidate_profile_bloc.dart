import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../resume/data/models/resume.dart';
import '../../../resume/domain/usecases/get_candidate_resumes_usecase.dart';

abstract class CandidateProfileEvent {}

class LoadCandidateProfile extends CandidateProfileEvent {}

class CandidateProfileState {
  final bool isLoading;
  final List<Resume>? resumes;
  final String? error;

  CandidateProfileState({
    this.isLoading = false,
    this.resumes,
    this.error,
  });

  CandidateProfileState copyWith({
    bool? isLoading,
    List<Resume>? resumes,
    String? error,
  }) {
    return CandidateProfileState(
      isLoading: isLoading ?? this.isLoading,
      resumes: resumes ?? this.resumes,
      error: error,
    );
  }
}

@injectable
class CandidateProfileBloc extends Bloc<CandidateProfileEvent, CandidateProfileState> {
  final GetCandidateResumesUseCase _getResumesUseCase;

  CandidateProfileBloc(this._getResumesUseCase) : super(CandidateProfileState()) {
    on<LoadCandidateProfile>(_onLoad);
  }

  Future<void> _onLoad(LoadCandidateProfile event, Emitter<CandidateProfileState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await _getResumesUseCase();

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, error: failure.message)),
      (resumes) => emit(state.copyWith(isLoading: false, resumes: resumes)),
    );
  }
}
