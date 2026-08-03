import 'package:dart_mappable/dart_mappable.dart';

part 'apply_vacancy_request.mapper.dart';

@MappableClass()
class ApplyVacancyRequest with ApplyVacancyRequestMappable {
  @MappableField(key: 'resume_id')
  final String? resumeId;
  @MappableField(key: 'cover_letter')
  final String? coverLetter;

  const ApplyVacancyRequest({
    this.resumeId,
    this.coverLetter,
  });

  factory ApplyVacancyRequest.fromJson(Map<String, dynamic> json) =>
      ApplyVacancyRequestMapper.fromMap(json);
}
