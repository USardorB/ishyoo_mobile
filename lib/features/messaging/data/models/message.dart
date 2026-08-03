import 'package:dart_mappable/dart_mappable.dart';
import 'chat_file.dart';

part 'message.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class Message with MessageMappable {
  final String id;
  final String? type;
  final String? content;
  final DateTime? sendedAt;
  final dynamic meta;
  final DateTime? readAt;
  final String? senderId;
  final String? chatId;
  final List<ChatFile>? files;

  const Message({
    required this.id,
    this.type,
    this.content,
    this.sendedAt,
    this.meta,
    this.readAt,
    this.senderId,
    this.chatId,
    this.files,
  });
}
