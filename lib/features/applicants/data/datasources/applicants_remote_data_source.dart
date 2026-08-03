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

  @GET('/mobile/employer/applicants')
  Future<BaseResult<List<Applicant>>> getApplicants({
    @Query('status') String? status,
  });

  @GET('/mobile/employer/vacancy/{vacancyId}/applicants')
  Future<BaseResult<List<Applicant>>> getVacancyApplicants(
    @Path('vacancyId') String vacancyId, {
    @Query('status') String? status,
  });

  @GET('/mobile/employer/vacancy/{vacancyId}/applicants/{vacancy_applicant_resume_id}')
  Future<BaseResult<Applicant>> getVacancyApplicantDetail(
    @Path('vacancyId') String vacancyId,
    @Path('vacancy_applicant_resume_id') String vacancyApplicantResumeId,
  );

  @POST(
    '/mobile/employer/vacancy/{vacancyId}/applicants/{vacancy_applicant_resume_id}/interview',
  )
  Future<BaseResult<dynamic>> scheduleInterview(
    @Path('vacancyId') String vacancyId,
    @Path('vacancy_applicant_resume_id') String vacancyApplicantResumeId,
    @Body() Map<String, dynamic> body,
  );

  @PUT('/mobile/employer/vacancy/{vacancyId}/applicants/{vacancy_applicant_resume_id}/status')
  Future<BaseResult<dynamic>> updateApplicationStatus(
    @Path('vacancyId') String vacancyId,
    @Path('vacancy_applicant_resume_id') String vacancyApplicantResumeId,
    @Body() Map<String, dynamic> body,
  );
}
