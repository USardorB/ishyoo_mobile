import 'dart:io' as dart_io;

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/shared/failures.dart';
import '../../../../core/extensions/repository_extension.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_data_source.dart';
import '../models/profile.dart';
import '../../../opportunities/data/models/organization.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Profile>> getCandidateProfile() {
    return remoteDataSource.getCandidateProfile().asEither();
  }

  @override
  Future<Either<Failure, Profile>> updateCandidateProfile(
    Map<String, dynamic> body,
  ) {
    return remoteDataSource.updateCandidateProfile(body).asEither();
  }

  @override
  Future<Either<Failure, Profile>> getEmployerProfile() {
    return remoteDataSource.getEmployerProfile().asEither();
  }

  @override
  Future<Either<Failure, Profile>> updateEmployerProfile(
    Map<String, dynamic> body,
  ) {
    return remoteDataSource.updateEmployerProfile(body).asEither();
  }

  @override
  Future<Either<Failure, Organization>> getEmployerOrganization() {
    return remoteDataSource.getEmployerOrganization().asEither();
  }

  @override
  Future<Either<Failure, Organization>> updateEmployerOrganization(
    Map<String, dynamic> body,
  ) {
    return remoteDataSource.updateEmployerOrganization(body).asEither();
  }

  @override
  Future<Either<Failure, Organization>> updateEmployerOrganizationLogo(
    dart_io.File logo,
  ) {
    return remoteDataSource.updateEmployerOrganizationLogo(logo).asEither();
  }
}
