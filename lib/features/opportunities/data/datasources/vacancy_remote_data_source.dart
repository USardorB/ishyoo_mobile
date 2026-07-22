import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/shared/models/base_result.dart';
import '../models/application_response.dart';
import '../models/vacancy.dart';

part 'vacancy_remote_data_source.g.dart';

@lazySingleton
@RestApi()
abstract class VacancyRemoteDataSource {
  @factoryMethod
  factory VacancyRemoteDataSource(Dio dio) = _VacancyRemoteDataSource;

  @GET('/mobile/{role}/vacancy/feed')
  Future<BaseResult<List<Vacancy>>> getVacancyFeed(
    @Path('role') String role, {
    @Query('limit') int? limit,
    @Query('specialization') String? specialization,
    @Query('job_type') String? jobType,
    @Query('experience_level') String? experienceLevel,
    @Query('title') String? title,
  });

  @GET('/mobile/{role}/nearby-jobs')
  Future<BaseResult<List<Vacancy>>> getNearbyJobs(
    @Path('role') String role,
    @Query('latitude') double latitude,
    @Query('longitude') double longitude,
    @Query('radius') int radius,
    @Query('limit') int limit,
  );
  @GET('/mobile/{role}/vacancy/feed/{id}')
  Future<BaseResult<Vacancy>> getVacancyDetail(
    @Path('role') String role,
    @Path('id') String id,
  );

  @POST('/mobile/{role}/vacancy/{id}/apply')
  Future<BaseResult<ApplicationResponse>> applyToVacancy(
    @Path('role') String role,
    @Path('id') String id,
    @Body() Map<String, dynamic> request,
  );

  @GET('/mobile/{role}/vacancy/{id}/save')
  Future<BaseResult<void>> saveVacancy(
    @Path('role') String role,
    @Path('id') String id,
  );

  @DELETE('/mobile/{role}/vacancy/{id}/save')
  Future<BaseResult<void>> unsaveVacancy(
    @Path('role') String role,
    @Path('id') String id,
  );

  @GET('/mobile/{role}/vacancy/saved')
  Future<BaseResult<List<Vacancy>>> getSavedVacancies(
    @Path('role') String role,
  );
}

