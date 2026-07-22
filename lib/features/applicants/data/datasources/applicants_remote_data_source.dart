import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/shared/models/base_result.dart';
import '../models/applicant.dart';

part 'applicants_remote_data_source.g.dart';

@lazySingleton
@RestApi()
abstract class ApplicantsRemoteDataSource {
  @factoryMethod
  factory ApplicantsRemoteDataSource(Dio dio) = _ApplicantsRemoteDataSource;

  @GET('/mobile/employer/vacancy/{vacancyId}/applicants')
  Future<BaseResult<List<Applicant>>> getVacancyApplicants(@Path('vacancyId') String vacancyId);

  @GET('/mobile/employer/vacancy/{vacancyId}/applicants/{applicantId}')
  Future<BaseResult<Applicant>> getVacancyApplicantDetail(
    @Path('vacancyId') String vacancyId,
    @Path('applicantId') String applicantId,
  );

  @POST('/mobile/employer/vacancy/{vacancyId}/applicants/{applicantId}/interview')
  Future<BaseResult<dynamic>> scheduleInterview(
    @Path('vacancyId') String vacancyId,
    @Path('applicantId') String applicantId,
    @Body() Map<String, dynamic> body,
  );

  @PUT('/mobile/employer/vacancy/{vacancyId}/applicants/{applicantId}/status')
  Future<BaseResult<dynamic>> updateApplicationStatus(
    @Path('vacancyId') String vacancyId,
    @Path('applicantId') String applicantId,
    @Body() Map<String, dynamic> body,
  );
}
