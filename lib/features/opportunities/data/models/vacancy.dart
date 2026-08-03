import 'package:dart_mappable/dart_mappable.dart';
import 'organization.dart';
import 'vacancy_contact.dart';

part 'vacancy.mapper.dart';

@MappableClass()
class Vacancy with VacancyMappable {
  final String id;
  @MappableField(key: 'job_title')
  final String jobTitle;
  final String? location;
  final String? specialization;
  @MappableField(key: 'job_type')
  final String? jobType;
  @MappableField(key: 'experience_level')
  final String? experienceLevel;
  @MappableField(key: 'salary_from')
  final double? salaryFrom;
  @MappableField(key: 'salary_to')
  final double? salaryTo;
  final String? currency;
  @MappableField(key: 'key_skills')
  final List<String>? keySkills;
  final String? description;
  final String? requirements;
  final String? responsibilities;
  final String? latitude;
  final String? longitude;
  final VacancyContact? contact;
  @MappableField(key: 'is_temporary')
  final bool? isTemporary;
  final String? status;
  @MappableField(key: 'published_at')
  final DateTime? publishedAt;
  @MappableField(key: 'updated_at')
  final DateTime? updatedAt;
  @MappableField(key: 'created_at')
  final DateTime? createdAt;
  @MappableField(key: 'organization_id')
  final String? organizationId;
  final Organization? organization;
  @MappableField(key: 'has_applied')
  final bool? hasApplied;
  @MappableField(key: 'has_saved')
  final bool? hasSaved;
  final double? distance;
  final Map<String, dynamic>? metadata;

  int get totalApplicationsCount =>
      metadata?['total_applications_count'] as int? ?? 0;

  const Vacancy({
    required this.id,
    required this.jobTitle,
    required this.location,
    required this.specialization,
    required this.jobType,
    required this.experienceLevel,
    this.salaryFrom,
    this.salaryTo,
    this.currency,
    this.keySkills,
    this.description,
    this.requirements,
    this.responsibilities,
    this.contact,
    this.isTemporary,
    this.status,
    this.publishedAt,
    this.updatedAt,
    this.createdAt,
    this.organizationId,
    this.organization,
    this.latitude,
    this.longitude,
    this.hasApplied,
    this.hasSaved,
    this.distance,
    this.metadata,
  });

  factory Vacancy.fromJson(Map<String, dynamic> json) =>
      VacancyMapper.fromMap(json);
}
