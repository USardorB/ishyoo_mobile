import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../data/models/resume.dart';
import '../../domain/usecases/get_resume_detail_usecase.dart';

abstract class ResumeDetailEvent {}

class LoadResumeDetail extends ResumeDetailEvent {
  final String id;
  LoadResumeDetail(this.id);
}

class ResumeDetailState {
  final bool isLoading;
  final Resume? resume;
  final String? error;

  ResumeDetailState({
    this.isLoading = false,
    this.resume,
    this.error,
  });

  ResumeDetailState copyWith({
    bool? isLoading,
    Resume? resume,
    String? error,
  }) {
    return ResumeDetailState(
      isLoading: isLoading ?? this.isLoading,
      resume: resume ?? this.resume,
      error: error,
    );
  }
}

@injectable
class ResumeDetailBloc extends Bloc<ResumeDetailEvent, ResumeDetailState> {
  final GetResumeDetailUseCase _getResumeDetailUseCase;

  ResumeDetailBloc(this._getResumeDetailUseCase) : super(ResumeDetailState()) {
    on<LoadResumeDetail>(_onLoad);
  }

  Future<void> _onLoad(LoadResumeDetail event, Emitter<ResumeDetailState> emit) async {
    emit(state.copyWith(isLoading: true, error: null));

    final result = await _getResumeDetailUseCase(GetResumeDetailParams(event.id));

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, error: failure.message)),
      (resume) => emit(state.copyWith(isLoading: false, resume: resume)),
    );
  }
}
