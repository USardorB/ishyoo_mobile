import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/shared/models/base_result.dart';
import '../models/resume.dart';

part 'resume_remote_data_source.g.dart';

@lazySingleton
@RestApi()
abstract class ResumeRemoteDataSource {
  @factoryMethod
  factory ResumeRemoteDataSource(Dio dio) = _ResumeRemoteDataSource;

  @GET('/mobile/candidate/resume')
  Future<BaseResult<List<Resume>>> getCandidateResumes();

  @GET('/mobile/candidate/resume/{id}')
  Future<BaseResult<Resume>> getResumeDetail(@Path('id') String id);

  @POST('/mobile/candidate/resume')
  Future<BaseResult<Resume>> createResume(@Body() Map<String, dynamic> body);

  @PUT('/mobile/candidate/resume/{id}')
  Future<BaseResult<Resume>> updateResume(@Path('id') String id, @Body() Map<String, dynamic> body);

  @DELETE('/mobile/candidate/resume/{id}')
  Future<BaseResult<dynamic>> deleteResume(@Path('id') String id);

  @POST('/mobile/candidate/resume/{id}/boost')
  Future<BaseResult<dynamic>> boostResume(@Path('id') String id);

  @GET('/mobile/candidate/resume/specialization')
  Future<BaseResult<List<String>>> getSpecializations();
}
