import 'package:dart_mappable/dart_mappable.dart';

part 'specialization.mapper.dart';

@MappableClass()
class Specialization with SpecializationMappable {
  final int id;
  final String name;
  @MappableField(key: 'parent_id')
  final int? parentId;
  final List<Specialization>? children;

  Specialization({
    required this.id,
    required this.name,
    this.parentId,
    this.children,
  });

  factory Specialization.fromJson(Map<String, dynamic> json) =>
      SpecializationMapper.fromMap(json);
}
