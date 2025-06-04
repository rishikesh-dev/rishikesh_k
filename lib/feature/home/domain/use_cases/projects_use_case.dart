import 'package:fpdart/fpdart.dart';
import 'package:portfolio_v2/core/failure/failure.dart';
import 'package:portfolio_v2/feature/home/domain/entity/project_entity.dart';
import 'package:portfolio_v2/feature/home/domain/repositories/project_repository.dart';

class ProjectsUseCase {
  final ProjectRepository repository;
  ProjectsUseCase(this.repository);
  Future<Either<Failure, List<ProjectEntity>>> call() async {
    return await repository.getProjects();
  }
}
