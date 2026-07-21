import 'package:dart_mappable/dart_mappable.dart';

part 'region.mapper.dart';

@MappableClass()
class Region with RegionMappable {
  final String id;
  final String? name;
  @MappableField(key: 'name_uz')
  final String? nameUz;
  @MappableField(key: 'name_ru')
  final String? nameRu;
  @MappableField(key: 'name_en')
  final String? nameEn;

  Region({
    required this.id,
    this.name,
    this.nameUz,
    this.nameRu,
    this.nameEn,
  });

  factory Region.fromJson(Map<String, dynamic> json) => RegionMapper.fromMap(json);
}
