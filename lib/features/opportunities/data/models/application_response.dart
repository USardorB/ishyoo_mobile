import 'package:dart_mappable/dart_mappable.dart';

part 'application_response.mapper.dart';

@MappableClass()
class ApplicationResponse with ApplicationResponseMappable {
  final num id;
  @MappableField(key: 'cover_letter')
  final String? coverLetter;
  final String status;
  @MappableField(key: 'created_at')
  final DateTime? createdAt;
  @MappableField(key: 'updated_at')
  final DateTime? updatedAt;
  @MappableField(key: 'vacancy_id')
  final String? vacancyId;
  @MappableField(key: 'resume_id')
  final String? resumeId;

  const ApplicationResponse({
    required this.id,
    this.coverLetter,
    required this.status,
    this.createdAt,
    this.updatedAt,
    this.vacancyId,
    this.resumeId,
  });

  factory ApplicationResponse.fromJson(Map<String, dynamic> json) => ApplicationResponseMapper.fromMap(json);
}
