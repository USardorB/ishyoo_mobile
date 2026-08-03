import 'package:dart_mappable/dart_mappable.dart';

import '../../../opportunities/data/models/vacancy.dart';

part 'application.mapper.dart';

@MappableClass()
class Application with ApplicationMappable {
  final int id;
  @MappableField(key: 'cover_letter')
  final String? coverLetter;
  final String status;
  @MappableField(key: 'created_at')
  final DateTime? createdAt;
  @MappableField(key: 'updated_at')
  final DateTime? updatedAt;
  @MappableField(key: 'resume_id')
  final String? resumeId;
  @MappableField(key: 'vacancy_id')
  final String? vacancyId;
  final Vacancy? vacancy;

  Application({
    required this.id,
    this.coverLetter,
    required this.status,
    this.createdAt,
    this.updatedAt,
    this.resumeId,
    this.vacancyId,
    this.vacancy,
  });

  factory Application.fromJson(Map<String, dynamic> json) =>
      ApplicationMapper.fromMap(json);
}
