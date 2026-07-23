class ResumePdfModel {
  final String? firstName;
  final String? lastName;
  final String? avatarUrl;
  final String? gender;
  final int? age;
  final DateTime? birthDate;
  final String? phone;
  final String? email;
  final String? location;
  final String? citizenship;
  final bool? hasWorkPermit;
  final String? specialization;
  final List<String>? employmentType;
  final List<String>? workFormat;
  final List<ResumePdfExperience>? experiences;
  final List<ResumePdfEducation>? educations;
  final List<String>? languages;
  final List<String>? skills;
  final DateTime? updatedAt;

  ResumePdfModel({
    this.firstName,
    this.lastName,
    this.avatarUrl,
    this.gender,
    this.age,
    this.birthDate,
    this.phone,
    this.email,
    this.location,
    this.citizenship,
    this.hasWorkPermit,
    this.specialization,
    this.employmentType,
    this.workFormat,
    this.experiences,
    this.educations,
    this.languages,
    this.skills,
    this.updatedAt,
  });
}

class ResumePdfExperience {
  final String? companyName;
  final String? position;
  final String? location; 
  final String? description;
  final DateTime? startDate;
  final DateTime? endDate;

  ResumePdfExperience({
    this.companyName,
    this.position,
    this.location,
    this.description,
    this.startDate,
    this.endDate,
  });
}

class ResumePdfEducation {
  final String? degree;
  final String? school;
  final String? fieldOfStudy;
  final DateTime? startDate;
  final DateTime? endDate;

  ResumePdfEducation({
    this.degree,
    this.school,
    this.fieldOfStudy,
    this.startDate,
    this.endDate,
  });
}
