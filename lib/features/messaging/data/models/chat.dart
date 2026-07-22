import 'package:dart_mappable/dart_mappable.dart';
import 'message.dart';

part 'chat.mapper.dart';

@MappableClass(caseStyle: CaseStyle.snakeCase)
class ChatPartner with ChatPartnerMappable {
  final String? name;
  final String? specialization;
  final String? avatar;

  const ChatPartner({
    this.name,
    this.specialization,
    this.avatar,
  });

  factory ChatPartner.fromJson(Map<String, dynamic> json) => ChatPartnerMapper.fromMap(json);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class ChatCount with ChatCountMappable {
  final int? messages;

  const ChatCount({
    this.messages,
  });

  factory ChatCount.fromJson(Map<String, dynamic> json) => ChatCountMapper.fromMap(json);
}

@MappableClass(caseStyle: CaseStyle.snakeCase)
class Chat with ChatMappable {
  final String id;
  final String? status;
  final DateTime? createdAt;
  final int? applicationId;
  @MappableField(key: '_count')
  final ChatCount? count;
  final Map<String, dynamic>? application;
  final List<Message>? messages;
  final ChatPartner? partner;

  const Chat({
    required this.id,
    this.status,
    this.createdAt,
    this.applicationId,
    this.count,
    this.application,
    this.messages,
    this.partner,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => ChatMapper.fromMap(json);
}
