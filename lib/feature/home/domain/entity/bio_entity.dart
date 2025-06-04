// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class BioEntity {
  final String name;
  final int age;
  final String email;
  final List<String> domains;
  final List<String> skills;
  final String description;
  final String instagram;
  final String x;
  final String youtube;
  final String github;
  final String linkedIn;
  final String resume;
  BioEntity({
    required this.name,
    required this.age,
    required this.email,
    required this.domains,
    required this.skills,
    required this.description,
    required this.instagram,
    required this.x,
    required this.youtube,
    required this.github,
    required this.linkedIn,
    required this.resume,
  });
}
