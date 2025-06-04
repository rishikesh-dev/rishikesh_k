import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:portfolio_v2/feature/home/data/models/project_model.dart';

abstract interface class ProjectRemoteDataSource<T> {
  Future<List<ProjectModel>> getProjects();
}

class ProjectRemoteDataSourceImpl
    extends ProjectRemoteDataSource<List<ProjectModel>> {
  final FirebaseFirestore firestore;

  ProjectRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<ProjectModel>> getProjects() async {
    final projects = await firestore.collection('projects').get();
    return projects.docs
        .map((doc) => ProjectModel.fromJson(doc.data()))
        .toList();
  }
}
