part of 'employer_organization_bloc.dart';

abstract class EmployerOrganizationEvent {
  const EmployerOrganizationEvent();
}

class LoadEmployerOrganization extends EmployerOrganizationEvent {}

class UpdateEmployerOrganization extends EmployerOrganizationEvent {
  final Map<String, dynamic> body;

  const UpdateEmployerOrganization(this.body);
}

class UploadOrganizationLogo extends EmployerOrganizationEvent {
  final File logo;

  const UploadOrganizationLogo(this.logo);
}
