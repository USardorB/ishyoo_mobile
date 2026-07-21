import 'package:dart_mappable/dart_mappable.dart';

part 'organization.mapper.dart';

@MappableClass()
class Organization with OrganizationMappable {
  final String id;
  final String? logo;
  final String name;
  final String? industry;
  final String? size;
  final String? website;
  final String? description;
  final String? location;
  @MappableField(key: 'created_at')
  final DateTime? createdAt;
  final double? balance;
  @MappableField(key: 'client_number')
  final int? clientNumber;
  final List<String>? perks;
  @MappableField(key: 'is_subscripted')
  final bool? isSubscripted;
  @MappableField(key: 'user_id')
  final String? userId;

  const Organization({
    required this.id,
    this.logo,
    required this.name,
    this.industry,
    this.size,
    this.website,
    this.description,
    this.location,
    this.createdAt,
    this.balance,
    this.clientNumber,
    this.perks,
    this.isSubscripted,
    this.userId,
  });

  factory Organization.fromJson(Map<String, dynamic> json) => OrganizationMapper.fromMap(json);
}
