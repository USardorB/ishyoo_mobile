import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile/features/opportunities/data/models/organization.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/shared/models/base_result.dart';
import '../models/profile.dart';

part 'profile_remote_data_source.g.dart';

@lazySingleton
@RestApi()
abstract class ProfileRemoteDataSource {
  @factoryMethod
  factory ProfileRemoteDataSource(Dio dio) = _ProfileRemoteDataSource;

  // Candidate Endpoints
  @GET('/mobile/candidate/profile')
  Future<BaseResult<Profile>> getCandidateProfile();

  @PUT('/mobile/candidate/profile')
  Future<BaseResult<Profile>> updateCandidateProfile(
    @Body() Map<String, dynamic> body,
  );

  @POST('/mobile/candidate/profile/upload-avatar')
  @MultiPart()
  Future<BaseResult<String>> uploadCandidateAvatar(
    @Part(name: 'file') File avatar,
  );

  // Employer Endpoints
  @GET('/mobile/employer/profile')
  Future<BaseResult<Profile>> getEmployerProfile();

  @PUT('/mobile/employer/profile')
  Future<BaseResult<Profile>> updateEmployerProfile(
    @Body() Map<String, dynamic> body,
  );

  @GET('/mobile/employer/organization')
  Future<BaseResult<Organization>> getEmployerOrganization();

  @PUT('/mobile/employer/organization')
  Future<BaseResult<Organization>> updateEmployerOrganization(
    @Body() Map<String, dynamic> body,
  );

  @POST('/mobile/employer/organization/logo-upload')
  @MultiPart()
  Future<BaseResult<String>> updateEmployerOrganizationLogo(
    @Part(name: 'file') File logo,
  );
}
