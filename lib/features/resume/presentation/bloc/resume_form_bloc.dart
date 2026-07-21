import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/create_resume_usecase.dart';
import '../../domain/usecases/update_resume_usecase.dart';

abstract class ResumeFormEvent {}

class UpdateFormData extends ResumeFormEvent {
  final Map<String, dynamic> data;
  UpdateFormData(this.data);
}

class SubmitResumeForm extends ResumeFormEvent {
  final String? resumeId;
  SubmitResumeForm({this.resumeId});
}

class ResumeFormState {
  final bool isSubmitting;
  final bool isSuccess;
  final String? error;
  final Map<String, dynamic> formData;

  ResumeFormState({
    this.isSubmitting = false,
    this.isSuccess = false,
    this.error,
    this.formData = const {},
  });

  ResumeFormState copyWith({
    bool? isSubmitting,
    bool? isSuccess,
    String? error,
    Map<String, dynamic>? formData,
  }) {
    return ResumeFormState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error,
      formData: formData ?? this.formData,
    );
  }
}

@injectable
class ResumeFormBloc extends Bloc<ResumeFormEvent, ResumeFormState> {
  final CreateResumeUseCase _createResumeUseCase;
  final UpdateResumeUseCase _updateResumeUseCase;

  ResumeFormBloc(
    this._createResumeUseCase,
    this._updateResumeUseCase,
  ) : super(ResumeFormState()) {
    on<UpdateFormData>(_onUpdateFormData);
    on<SubmitResumeForm>(_onSubmit);
  }

  void _onUpdateFormData(UpdateFormData event, Emitter<ResumeFormState> emit) {
    final updatedData = Map<String, dynamic>.from(state.formData)..addAll(event.data);
    emit(state.copyWith(formData: updatedData));
  }

  Future<void> _onSubmit(SubmitResumeForm event, Emitter<ResumeFormState> emit) async {
    emit(state.copyWith(isSubmitting: true, error: null));

    final result = event.resumeId == null
        ? await _createResumeUseCase(CreateResumeParams(state.formData))
        : await _updateResumeUseCase(UpdateResumeParams(event.resumeId!, state.formData));

    result.fold(
      (failure) => emit(state.copyWith(isSubmitting: false, error: failure.message)),
      (_) => emit(state.copyWith(isSubmitting: false, isSuccess: true)),
    );
  }
}
