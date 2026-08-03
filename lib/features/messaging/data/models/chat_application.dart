import 'package:dart_mappable/dart_mappable.dart';

part 'chat_application.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class ChatApplication with ChatApplicationMappable {
  final ChatVacancy? vacancy;
  final ChatResume? resume;

  const ChatApplication({
    this.vacancy,
    this.resume,
  });

  factory ChatApplication.fromJson(Map<String, dynamic> json) =>
      ChatApplicationMapper.fromMap(json);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class ChatVacancy with ChatVacancyMappable {
  final String? id;
  final ChatOrganization? organization;

  const ChatVacancy({
    this.id,
    this.organization,
  });

  factory ChatVacancy.fromJson(Map<String, dynamic> json) =>
      ChatVacancyMapper.fromMap(json);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class ChatOrganization with ChatOrganizationMappable {
  final String? logoUrl;
  final String? name;
  final String? industry;

  const ChatOrganization({
    this.logoUrl,
    this.name,
    this.industry,
  });

  factory ChatOrganization.fromJson(Map<String, dynamic> json) =>
      ChatOrganizationMapper.fromMap(json);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class ChatResume with ChatResumeMappable {
  final String? id;
  final String? specialization;
  final ChatProfile? profile;
  final ChatProfile? user; // Keeping user for backwards compatibility with chats_page.dart

  const ChatResume({
    this.id,
    this.specialization,
    this.profile,
    this.user,
  });

  factory ChatResume.fromJson(Map<String, dynamic> json) =>
      ChatResumeMapper.fromMap(json);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class ChatProfile with ChatProfileMappable {
  final String? name;
  final String? avatarUrl;

  const ChatProfile({
    this.name,
    this.avatarUrl,
  });

  factory ChatProfile.fromJson(Map<String, dynamic> json) =>
      ChatProfileMapper.fromMap(json);
}
