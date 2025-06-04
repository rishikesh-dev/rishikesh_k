import 'package:fpdart/fpdart.dart';
import 'package:portfolio_v2/core/failure/failure.dart';
import 'package:portfolio_v2/feature/home/data/data_sources/project_remote_data_source.dart';
import 'package:portfolio_v2/feature/home/domain/entity/project_entity.dart';
import 'package:portfolio_v2/feature/home/domain/repositories/project_repository.dart';

class ProjectsRepositoryimpl extends ProjectRepository {
  ProjectRemoteDataSource remoteDataSource;
  ProjectsRepositoryimpl(this.remoteDataSource);
  @override
  Future<Either<Failure, List<ProjectEntity>>> getProjects() async {
    try {
      final projects = await remoteDataSource.getProjects();
      return right(projects);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
