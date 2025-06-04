import 'package:fpdart/fpdart.dart';
import 'package:portfolio_v2/core/failure/failure.dart';
import 'package:portfolio_v2/feature/home/domain/entity/project_entity.dart';

abstract class ProjectRepository {
  Future<Either<Failure, List<ProjectEntity>>> getProjects();
}
