import 'package:dart_mappable/dart_mappable.dart';

part 'chat_file.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class ChatFile with ChatFileMappable {
  final String? id;
  final String? originalName;
  final String? filename;
  final String? mimeType;
  final int? size;
  final String? type;
  final String? path;
  final DateTime? createdAt;
  final String? messageId;
  final String? uploadedBy;

  const ChatFile({
    this.id,
    this.originalName,
    this.filename,
    this.mimeType,
    this.size,
    this.type,
    this.path,
    this.createdAt,
    this.messageId,
    this.uploadedBy,
  });

  factory ChatFile.fromJson(Map<String, dynamic> json) =>
      ChatFileMapper.fromMap(json);
}
