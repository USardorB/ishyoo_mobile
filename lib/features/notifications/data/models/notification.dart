import 'package:dart_mappable/dart_mappable.dart';

part 'notification.mapper.dart';

@MappableClass()
class Notification with NotificationMappable {
  final int id;
  final String type;
  final String title;
  final String message;
  @MappableField(key: 'is_read')
  final bool isRead;
  @MappableField(key: 'created_at')
  final DateTime? createdAt;
  @MappableField(key: 'updated_at')
  final DateTime? updatedAt;
  @MappableField(key: 'user_id')
  final String? userId;

  Notification({
    required this.id,
    required this.type,
    required this.title,
    required this.message,
    required this.isRead,
    this.createdAt,
    this.updatedAt,
    this.userId,
  });

  factory Notification.fromJson(Map<String, dynamic> json) => NotificationMapper.fromMap(json);
}
