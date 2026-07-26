part of 'company_details_bloc.dart';

abstract class CompanyDetailsEvent {}

class LoadCompanyDetails extends CompanyDetailsEvent {
  final String id;
  LoadCompanyDetails(this.id);
}
