import 'package:portfolio_v2/feature/home/domain/entity/project_entity.dart';

class ProjectModel extends ProjectEntity {
  ProjectModel({
    required super.imgUrl,
    required super.title,
    required super.url,
    required super.description,
  });
  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      imgUrl: json['imgUrl'],
      title: json['title'],
      url: json['url'],
      description: json['description'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'imgUrl': imgUrl,
      'url': url,
      'description': description,
    };
  }
}
