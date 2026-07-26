import 'package:dart_mappable/dart_mappable.dart';

part 'resume.mapper.dart';

@MappableClass()
class ResumeEducation with ResumeEducationMappable {
  final String degree;
  final String school;
  @MappableField(key: 'start_date')
  final DateTime? startDate;
  @MappableField(key: 'end_date')
  final DateTime? endDate;

  ResumeEducation({
    required this.degree,
    required this.school,
    this.startDate,
    this.endDate,
  });

  factory ResumeEducation.fromJson(Map<String, dynamic> json) =>
      ResumeEducationMapper.fromMap(json);
}

@MappableClass()
class ResumeExperience with ResumeExperienceMappable {
  @MappableField(key: 'company_name')
  final String companyName;
  final String position;
  final String? description;
  @MappableField(key: 'start_date')
  final DateTime? startDate;
  @MappableField(key: 'end_date')
  final DateTime? endDate;

  ResumeExperience({
    required this.companyName,
    required this.position,
    this.description,
    this.startDate,
    this.endDate,
  });

  factory ResumeExperience.fromJson(Map<String, dynamic> json) =>
      ResumeExperienceMapper.fromMap(json);
}

@MappableClass()
class Resume with ResumeMappable {
  final String id;
  @MappableField(key: 'user_id')
  final String? userId;
  final String? specialization;
  @MappableField(key: 'expected_salary')
  final int? expectedSalary;
  final String? currency;
  @MappableField(key: 'employment_type')
  final List<String>? employmentType;
  @MappableField(key: 'work_format')
  final List<String>? workFormat;
  final List<String>? skills;
  final List<ResumeEducation>? educations;
  final List<ResumeExperience>? experiences;
  final String? visibility;
  final String? status;
  @MappableField(key: 'is_primary')
  final bool? isPrimary;
  @MappableField(key: 'boost_score')
  final int? boostScore;
  @MappableField(key: 'boosted_at')
  final DateTime? boostedAt;
  @MappableField(key: 'boost_until')
  final DateTime? boostUntil;
  @MappableField(key: 'next_free_boost_at')
  final DateTime? nextFreeBoostAt;
  @MappableField(key: 'created_at')
  final DateTime? createdAt;
  @MappableField(key: 'updated_at')
  final DateTime? updatedAt;
  @MappableField(key: 'available_for_boost')
  final bool? availableForBoost;

  Resume({
    required this.id,
    this.userId,
    this.specialization,
    this.expectedSalary,
    this.currency,
    this.employmentType,
    this.workFormat,
    this.skills,
    this.educations,
    this.experiences,
    this.visibility,
    this.status,
    this.isPrimary,
    this.boostScore,
    this.boostedAt,
    this.boostUntil,
    this.nextFreeBoostAt,
    this.createdAt,
    this.updatedAt,
    this.availableForBoost,
  });

  factory Resume.fromJson(Map<String, dynamic> json) =>
      ResumeMapper.fromMap(json);
}
