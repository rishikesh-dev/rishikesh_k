import 'package:portfolio_v2/feature/home/domain/entity/bio_entity.dart';

class BioModel extends BioEntity {
  BioModel({
    required super.name,
    required super.age,
    required super.email,
    required super.domains,
    required super.skills,
    required super.description,
    required super.instagram,
    required super.x,
    required super.youtube,
    required super.github,
    required super.linkedIn,
    required super.resume,
  });

  factory BioModel.fromJson(Map<String, dynamic> json) {
    return BioModel(
      name: json['name'] ?? '',
      age: json['age'] ?? '',
      email: json['email'] ?? '',
      domains:
          (json['domains'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      skills:
          (json['skills'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          ['Flutter', 'Dart'],
      description: json['description'] ?? '',
      github: json['github'] ?? '',
      youtube: json['youtube'] ?? '',
      instagram: json['instagram'] ?? '',
      linkedIn: json['linkedIn'] ?? '',
      x: json['x'] ?? '',
      resume: json['resume'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'email': email,
      'domains': domains,
      'skills': skills,
      'description': description,
      'x': x,
      'instagram': instagram,
      'youtube': youtube,
      'github': github,
      'resume': resume,
    };
  }
}
