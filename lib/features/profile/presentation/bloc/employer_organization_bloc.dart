import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../opportunities/data/models/organization.dart';
import '../../domain/repositories/profile_repository.dart';

part 'employer_organization_event.dart';
part 'employer_organization_state.dart';

@injectable
class EmployerOrganizationBloc
    extends Bloc<EmployerOrganizationEvent, EmployerOrganizationState> {
  final ProfileRepository _repository;

  EmployerOrganizationBloc(this._repository)
    : super(const EmployerOrganizationState()) {
    on<LoadEmployerOrganization>(_onLoadEmployerOrganization);
    on<UpdateEmployerOrganization>(_onUpdateEmployerOrganization);
    on<UploadOrganizationLogo>(_onUploadOrganizationLogo);
  }

  Future<void> _onLoadEmployerOrganization(
    LoadEmployerOrganization event,
    Emitter<EmployerOrganizationState> emit,
  ) async {
    emit(state.copyWith(status: EmployerOrganizationStatus.loading));

    final result = await _repository.getEmployerOrganization();

    result.fold(
      (failure) => emit(
        state.copyWith(
          status: EmployerOrganizationStatus.error,
          error: failure.message,
        ),
      ),
      (organization) => emit(
        state.copyWith(
          status: EmployerOrganizationStatus.loaded,
          organization: organization,
        ),
      ),
    );
  }

  Future<void> _onUpdateEmployerOrganization(
    UpdateEmployerOrganization event,
    Emitter<EmployerOrganizationState> emit,
  ) async {
    emit(
      state.copyWith(updateStatus: EmployerOrganizationUpdateStatus.loading),
    );

    final result = await _repository.updateEmployerOrganization(event.body);

    result.fold(
      (failure) => emit(
        state.copyWith(
          updateStatus: EmployerOrganizationUpdateStatus.error,
          error: failure.message,
        ),
      ),
      (organization) => emit(
        state.copyWith(
          updateStatus: EmployerOrganizationUpdateStatus.success,
          organization: organization,
        ),
      ),
    );
  }

  Future<void> _onUploadOrganizationLogo(
    UploadOrganizationLogo event,
    Emitter<EmployerOrganizationState> emit,
  ) async {
    emit(
      state.copyWith(updateStatus: EmployerOrganizationUpdateStatus.loading),
    );

    final result = await _repository.updateEmployerOrganizationLogo(event.logo);

    result.fold(
      (failure) => emit(
        state.copyWith(
          updateStatus: EmployerOrganizationUpdateStatus.error,
          error: failure.message,
        ),
      ),
      (logoUrl) {
        final updatedOrganization = state.organization?.copyWith(logo: logoUrl);
        emit(
          state.copyWith(
            updateStatus: EmployerOrganizationUpdateStatus.success,
            organization: updatedOrganization,
          ),
        );
      },
    );
  }
}
