import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/boost_resume_usecase.dart';
import '../../domain/usecases/create_resume_usecase.dart';
import '../../domain/usecases/delete_resume_usecase.dart';
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

class DeleteResume extends ResumeFormEvent {
  final String resumeId;
  DeleteResume(this.resumeId);
}

class BoostResume extends ResumeFormEvent {
  final String resumeId;
  BoostResume(this.resumeId);
}

class ResumeFormState {
  final bool isSubmitting;
  final bool isSuccess;
  final bool isDeleted;
  final bool isBoosted;
  final String? error;
  final Map<String, dynamic> formData;

  ResumeFormState({
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isDeleted = false,
    this.isBoosted = false,
    this.error,
    this.formData = const {},
  });

  ResumeFormState copyWith({
    bool? isSubmitting,
    bool? isSuccess,
    bool? isDeleted,
    bool? isBoosted,
    String? error,
    Map<String, dynamic>? formData,
  }) {
    return ResumeFormState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isDeleted: isDeleted ?? this.isDeleted,
      isBoosted: isBoosted ?? this.isBoosted,
      error: error,
      formData: formData ?? this.formData,
    );
  }
}

@injectable
class ResumeFormBloc extends Bloc<ResumeFormEvent, ResumeFormState> {
  final CreateResumeUseCase _createResumeUseCase;
  final UpdateResumeUseCase _updateResumeUseCase;
  final DeleteResumeUseCase _deleteResumeUseCase;
  final BoostResumeUseCase _boostResumeUseCase;

  ResumeFormBloc(
    this._createResumeUseCase,
    this._updateResumeUseCase,
    this._deleteResumeUseCase,
    this._boostResumeUseCase,
    @factoryParam Map<String, dynamic>? initialData,
  ) : super(ResumeFormState(formData: initialData ?? const {})) {
    on<UpdateFormData>(_onUpdateFormData);
    on<SubmitResumeForm>(_onSubmit);
    on<DeleteResume>(_onDelete);
    on<BoostResume>(_onBoost);
  }

  void _onUpdateFormData(UpdateFormData event, Emitter<ResumeFormState> emit) {
    final updatedData = Map<String, dynamic>.from(state.formData)
      ..addAll(event.data);
    emit(state.copyWith(formData: updatedData));
  }

  Future<void> _onSubmit(
    SubmitResumeForm event,
    Emitter<ResumeFormState> emit,
  ) async {
    emit(state.copyWith(isSubmitting: true, error: null));
    final submitData = Map<String, dynamic>.from(state.formData);
    submitData.remove('email');
    submitData.remove('phone');

    final result = event.resumeId == null
        ? await _createResumeUseCase(CreateResumeParams(submitData))
        : await _updateResumeUseCase(
            UpdateResumeParams(event.resumeId!, submitData),
          );

    result.fold(
      (failure) =>
          emit(state.copyWith(isSubmitting: false, error: failure.message)),
      (_) => emit(state.copyWith(isSubmitting: false, isSuccess: true)),
    );
  }

  Future<void> _onDelete(
    DeleteResume event,
    Emitter<ResumeFormState> emit,
  ) async {
    emit(state.copyWith(isSubmitting: true, error: null));
    final result = await _deleteResumeUseCase(
      DeleteResumeParams(event.resumeId),
    );
    result.fold(
      (failure) =>
          emit(state.copyWith(isSubmitting: false, error: failure.message)),
      (_) => emit(state.copyWith(isSubmitting: false, isDeleted: true)),
    );
  }

  Future<void> _onBoost(
    BoostResume event,
    Emitter<ResumeFormState> emit,
  ) async {
    emit(state.copyWith(isSubmitting: true, error: null));
    final result = await _boostResumeUseCase(BoostResumeParams(event.resumeId));
    result.fold(
      (failure) =>
          emit(state.copyWith(isSubmitting: false, error: failure.message)),
      (_) => emit(state.copyWith(isSubmitting: false, isBoosted: true)),
    );
  }
}
