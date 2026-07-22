part of 'employer_organization_bloc.dart';

enum EmployerOrganizationStatus { initial, loading, loaded, error }

enum EmployerOrganizationUpdateStatus { initial, loading, success, error }

class EmployerOrganizationState {
  final EmployerOrganizationStatus status;
  final EmployerOrganizationUpdateStatus updateStatus;
  final Organization? organization;
  final String? error;

  const EmployerOrganizationState({
    this.status = EmployerOrganizationStatus.initial,
    this.updateStatus = EmployerOrganizationUpdateStatus.initial,
    this.organization,
    this.error,
  });

  EmployerOrganizationState copyWith({
    EmployerOrganizationStatus? status,
    EmployerOrganizationUpdateStatus? updateStatus,
    Organization? organization,
    String? error,
  }) {
    return EmployerOrganizationState(
      status: status ?? this.status,
      updateStatus: updateStatus ?? this.updateStatus,
      organization: organization ?? this.organization,
      error: error ?? this.error,
    );
  }

  bool get isLoading => status == EmployerOrganizationStatus.loading;
  bool get isUpdating =>
      updateStatus == EmployerOrganizationUpdateStatus.loading;
  bool get isUpdateSuccess =>
      updateStatus == EmployerOrganizationUpdateStatus.success;
}
