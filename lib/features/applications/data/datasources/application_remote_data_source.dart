import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/shared/models/base_result.dart';
import '../models/application.dart';

part 'application_remote_data_source.g.dart';

@lazySingleton
@RestApi()
abstract class ApplicationRemoteDataSource {
  @factoryMethod
  factory ApplicationRemoteDataSource(Dio dio) = _ApplicationRemoteDataSource;

  @GET('/mobile/candidate/application')
  Future<BaseResult<List<Application>>> getApplications({
    @Query('status') String? status,
  });

  @GET('/mobile/candidate/application/{id}')
  Future<BaseResult<Application>> getApplicationDetail(
    @Path('id') String id,
  );

  @PUT('/mobile/candidate/application/{id}/refuse')
  Future<BaseResult<Application>> updateApplicationStatus(
    @Path('id') String id,
    @Body() Map<String, dynamic> request,
  );
}
