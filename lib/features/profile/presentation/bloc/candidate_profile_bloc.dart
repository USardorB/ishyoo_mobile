import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../resume/data/models/resume.dart';
import '../../../resume/domain/usecases/get_candidate_resumes_usecase.dart';
import '../../domain/repositories/profile_repository.dart';
import '../../data/models/profile.dart';

abstract class CandidateProfileEvent {}

class LoadCandidateProfile extends CandidateProfileEvent {}

class UpdateCandidateProfile extends CandidateProfileEvent {
  final Map<String, dynamic> body;
  UpdateCandidateProfile(this.body);
}

class CandidateProfileState {
  final bool isLoading;
  final bool isUpdating;
  final bool isUpdateSuccess;
  final List<Resume>? resumes;
  final Profile? profile;
  final String? error;

  CandidateProfileState({
    this.isLoading = false,
    this.isUpdating = false,
    this.isUpdateSuccess = false,
    this.resumes,
    this.profile,
    this.error,
  });

  CandidateProfileState copyWith({
    bool? isLoading,
    bool? isUpdating,
    bool? isUpdateSuccess,
    List<Resume>? resumes,
    Profile? profile,
    String? error,
  }) {
    return CandidateProfileState(
      isLoading: isLoading ?? this.isLoading,
      isUpdating: isUpdating ?? this.isUpdating,
      isUpdateSuccess: isUpdateSuccess ?? this.isUpdateSuccess,
      resumes: resumes ?? this.resumes,
      profile: profile ?? this.profile,
      error: error,
    );
  }
}

@injectable
class CandidateProfileBloc extends Bloc<CandidateProfileEvent, CandidateProfileState> {
  final GetCandidateResumesUseCase _getResumesUseCase;
  final ProfileRepository _profileRepository;

  CandidateProfileBloc(
    this._getResumesUseCase,
    this._profileRepository,
  ) : super(CandidateProfileState()) {
    on<LoadCandidateProfile>(_onLoad);
    on<UpdateCandidateProfile>(_onUpdate);
  }

  Future<void> _onLoad(LoadCandidateProfile event, Emitter<CandidateProfileState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));

    final resumesResult = await _getResumesUseCase();
    final profileResult = await _profileRepository.getCandidateProfile();

    resumesResult.fold(
      (failure) => emit(state.copyWith(isLoading: false, error: failure.message)),
      (resumes) {
        profileResult.fold(
          (failure) => emit(state.copyWith(isLoading: false, error: failure.message)),
          (profile) => emit(state.copyWith(isLoading: false, resumes: resumes, profile: profile)),
        );
      },
    );
  }

  Future<void> _onUpdate(UpdateCandidateProfile event, Emitter<CandidateProfileState> emit) async {
    emit(state.copyWith(isUpdating: true, error: null));
    final result = await _profileRepository.updateCandidateProfile(event.body);
    result.fold(
      (failure) => emit(state.copyWith(isUpdating: false, error: failure.message)),
      (profile) => emit(state.copyWith(isUpdating: false, isUpdateSuccess: true, profile: profile)),
    );
  }
}
