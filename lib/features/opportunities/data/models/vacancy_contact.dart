import 'package:dart_mappable/dart_mappable.dart';

part 'vacancy_contact.mapper.dart';

@MappableClass()
class VacancyContact with VacancyContactMappable {
  final String? name;
  final String? email;
  @MappableField(key: 'phone_number')
  final String? phoneNumber;

  const VacancyContact({
    this.name,
    this.email,
    this.phoneNumber,
  });

  factory VacancyContact.fromJson(Map<String, dynamic> json) =>
      VacancyContactMapper.fromMap(json);
}
