import 'package:dart_mappable/dart_mappable.dart';

part 'resume_language.mapper.dart';

@MappableClass()
class ResumeLanguage with ResumeLanguageMappable {
  final String lang;
  final String level;

  ResumeLanguage({
    required this.lang,
    required this.level,
  });

  factory ResumeLanguage.fromJson(Map<String, dynamic> json) =>
      ResumeLanguageMapper.fromMap(json);
}
