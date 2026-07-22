import 'package:dart_mappable/dart_mappable.dart';
import '../../../resume/data/models/resume.dart';

part 'applicant.mapper.dart';

@MappableClass()
class ApplicantUser with ApplicantUserMappable {
  final String id;
  final String? name;
  @MappableField(key: 'phone_number')
  final String? phoneNumber;
  final String? email;
  final String? role;

  ApplicantUser({
    required this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.role,
  });

  factory ApplicantUser.fromJson(Map<String, dynamic> json) => ApplicantUserMapper.fromMap(json);
}

@MappableClass()
class Applicant with ApplicantMappable {
  final String id;
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
  @MappableField(key: 'is_special')
  final bool? isSpecial;
  @MappableField(key: 'created_at')
  final DateTime? createdAt;
  @MappableField(key: 'updated_at')
  final DateTime? updatedAt;
  @MappableField(key: 'user_id')
  final String? userId;
  final ApplicantUser? user;
  @MappableField(key: 'application_status')
  final String? applicationStatus;

  Applicant({
    required this.id,
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
    this.isSpecial,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.user,
    this.applicationStatus,
  });

  factory Applicant.fromJson(Map<String, dynamic> json) => ApplicantMapper.fromMap(json);
}
