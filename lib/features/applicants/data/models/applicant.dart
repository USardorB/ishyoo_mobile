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

  @MappableField(key: 'avatar_url')
  final String? avatarUrl;
  @MappableField(key: 'is_waitlisted_user')
  final bool? isWaitlistedUser;
  final String? status;
  final String? password;
  final String? city;
  final String? bio;
  @MappableField(key: 'birth_date')
  final String? birthDate;
  @MappableField(key: 'network_status')
  final String? networkStatus;
  @MappableField(key: 'last_seen')
  final DateTime? lastSeen;
  @MappableField(key: 'created_at')
  final DateTime? createdAt;
  @MappableField(key: 'updated_at')
  final DateTime? updatedAt;
  @MappableField(key: 'user_id')
  final String? userId;

  ApplicantUser({
    required this.id,
    this.name,
    this.phoneNumber,
    this.email,
    this.role,
    this.avatarUrl,
    this.isWaitlistedUser,
    this.status,
    this.password,
    this.city,
    this.bio,
    this.birthDate,
    this.networkStatus,
    this.lastSeen,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  factory ApplicantUser.fromJson(Map<String, dynamic> json) =>
      ApplicantUserMapper.fromMap(json);
}

@MappableClass()
class ApplicantChat with ApplicantChatMappable {
  final String id;
  final String? status;
  @MappableField(key: 'created_at')
  final DateTime? createdAt;
  @MappableField(key: 'application_id')
  final int? applicationId;

  ApplicantChat({
    required this.id,
    this.status,
    this.createdAt,
    this.applicationId,
  });

  factory ApplicantChat.fromJson(Map<String, dynamic> json) =>
      ApplicantChatMapper.fromMap(json);
}

@MappableClass()
class ApplicantMetadata with ApplicantMetadataMappable {
  final ApplicantChat? chat;

  ApplicantMetadata({this.chat});

  factory ApplicantMetadata.fromJson(Map<String, dynamic> json) =>
      ApplicantMetadataMapper.fromMap(json);
}

@MappableClass()
class Applicant with ApplicantMappable {
  final String id;

  @MappableField(key: 'resume_id')
  final String? resumeId;
  final ApplicantMetadata? metadata;
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
  @MappableField(key: 'user_id')
  final String? userId;
  final ApplicantUser? user;
  @MappableField(key: 'profile_id')
  final String? profileId;
  final ApplicantUser? profile;
  @MappableField(key: 'application_status')
  final String? applicationStatus;

  @MappableField(key: 'vacancy_id')
  final String? vacancyId;
  @MappableField(key: 'chat_id')
  final String? chatId;

  Applicant({
    required this.id,
    this.resumeId,
    this.metadata,
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
    this.isPrimary,
    this.boostScore,
    this.boostedAt,
    this.boostUntil,
    this.nextFreeBoostAt,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.user,
    this.profileId,
    this.profile,
    this.applicationStatus,
    this.vacancyId,
    this.chatId,
  });

  factory Applicant.fromJson(Map<String, dynamic> json) =>
      ApplicantMapper.fromMap(json);
}
