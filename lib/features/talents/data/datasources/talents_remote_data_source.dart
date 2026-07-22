import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/shared/models/base_result.dart';
import '../../../resume/data/models/resume.dart';

part 'talents_remote_data_source.g.dart';

@lazySingleton
@RestApi()
abstract class TalentsRemoteDataSource {
  @factoryMethod
  factory TalentsRemoteDataSource(Dio dio) = _TalentsRemoteDataSource;

  @GET('/mobile/employer/resume/feed')
  Future<BaseResult<List<Resume>>> getTalentFeed();

  @GET('/mobile/employer/resume/feed/{id}')
  Future<BaseResult<Resume>> getTalentDetail(@Path('id') String id);

  @POST('/mobile/employer/resume/{id}/save')
  Future<BaseResult<dynamic>> saveTalent(@Path('id') String id);

  @DELETE('/mobile/employer/resume/{id}/save')
  Future<BaseResult<dynamic>> unsaveTalent(@Path('id') String id);
}
