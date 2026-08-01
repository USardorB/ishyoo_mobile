import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:mobile/features/opportunities/data/models/organization.dart';

import '../../../../core/shared/failures.dart';
import '../../data/models/profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, Profile>> getCandidateProfile();
  Future<Either<Failure, Profile>> updateCandidateProfile(
    Map<String, dynamic> body,
  );
  Future<Either<Failure, String>> uploadCandidateAvatar(
    File avatar,
  );
  Future<Either<Failure, Profile>> getEmployerProfile();
  Future<Either<Failure, Profile>> updateEmployerProfile(
    Map<String, dynamic> body,
  );
  Future<Either<Failure, Organization>> getEmployerOrganization();
  Future<Either<Failure, Organization>> updateEmployerOrganization(
    Map<String, dynamic> body,
  );
  Future<Either<Failure, String>> updateEmployerOrganizationLogo(
    File logo,
  );
}
