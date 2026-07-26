import 'package:dart_mappable/dart_mappable.dart';

part 'profile.mapper.dart';

@MappableClass()
class Profile with ProfileMappable {
  final String id;
  @MappableField(key: 'avatar_url')
  final String? avatarUrl;
  @MappableField(key: 'first_name')
  final String? firstName;
  @MappableField(key: 'last_name')
  final String? lastName;
  final String? name;
  final String? role;
  @MappableField(key: 'network_status')
  final String? networkStatus;
  @MappableField(key: 'last_seen')
  final String? lastSeen;
  final String? email;
  @MappableField(key: 'phone_number')
  final String? phoneNumber;
  final String? city;
  @MappableField(key: 'birth_date')
  final String? birthDate;
  final String? bio;

  Profile({
    required this.id,
    this.avatarUrl,
    this.firstName,
    this.lastName,
    this.name,
    this.role,
    this.networkStatus,
    this.lastSeen,
    this.email,
    this.phoneNumber,
    this.city,
    this.birthDate,
    this.bio,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      ProfileMapper.fromMap(json);
}
