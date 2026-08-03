part of 'company_details_bloc.dart';

enum CompanyDetailsStatus { initial, loading, loaded, error }

class CompanyDetailsState {
  final CompanyDetailsStatus status;
  final Organization? organization;
  final String? errorMessage;

  const CompanyDetailsState({
    this.status = CompanyDetailsStatus.initial,
    this.organization,
    this.errorMessage,
  });

  CompanyDetailsState copyWith({
    CompanyDetailsStatus? status,
    Organization? organization,
    String? errorMessage,
  }) {
    return CompanyDetailsState(
      status: status ?? this.status,
      organization: organization ?? this.organization,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
