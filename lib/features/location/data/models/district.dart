import 'package:dart_mappable/dart_mappable.dart';

part 'district.mapper.dart';

@MappableClass()
class District with DistrictMappable {
  final String id;
  @MappableField(key: 'region_id')
  final String? regionId;
  final String? name;
  @MappableField(key: 'name_uz')
  final String? nameUz;
  @MappableField(key: 'name_ru')
  final String? nameRu;
  @MappableField(key: 'name_en')
  final String? nameEn;

  District({
    required this.id,
    this.regionId,
    this.name,
    this.nameUz,
    this.nameRu,
    this.nameEn,
  });

  factory District.fromJson(Map<String, dynamic> json) => DistrictMapper.fromMap(json);
}
