import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/shared/models/base_result.dart';
import '../../../opportunities/data/models/vacancy.dart';
import '../models/employer_stats.dart';
import '../../../resume/data/models/specialization.dart';

part 'postings_remote_data_source.g.dart';

@lazySingleton
@RestApi()
abstract class PostingsRemoteDataSource {
  @factoryMethod
  factory PostingsRemoteDataSource(Dio dio) = _PostingsRemoteDataSource;

  @GET('/mobile/employer/vacancy')
  Future<BaseResult<List<Vacancy>>> getVacancies({
    @Query('page') int? page,
    @Query('limit') int? limit,
  });

  @GET('/mobile/employer/vacancy/{id}')
  Future<BaseResult<Vacancy>> getVacancyDetail(@Path('id') String id);

  @POST('/mobile/employer/vacancy')
  Future<BaseResult<Vacancy>> createVacancy(@Body() Map<String, dynamic> body);

  @PUT('/mobile/employer/vacancy/{id}')
  Future<BaseResult<Vacancy>> updateVacancy(@Path('id') String id, @Body() Map<String, dynamic> body);

  @PUT('/mobile/employer/vacancy/{id}/archive')
  Future<BaseResult<Vacancy>> archiveVacancy(@Path('id') String id);

  @POST('/mobile/employer/vacancy/{id}/publish')
  Future<BaseResult<Vacancy>> publishVacancy(@Path('id') String id);

  @GET('/mobile/employer/vacancy/specialization')
  Future<BaseResult<List<Specialization>>> getSpecializations();

  @GET('/mobile/employer/stats')
  Future<BaseResult<EmployerStats>> getEmployerStats();
}
