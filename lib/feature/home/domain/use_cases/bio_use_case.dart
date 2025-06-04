import 'package:fpdart/fpdart.dart';
import 'package:portfolio_v2/core/failure/failure.dart';
import 'package:portfolio_v2/feature/home/domain/entity/bio_entity.dart';
import 'package:portfolio_v2/feature/home/domain/repositories/bio_repository.dart';

class BioUseCase {
  final BioRepository repository;

  BioUseCase(this.repository);
  Future<Either<Failure, BioEntity>> call() async {
    return await repository.getDetails();
  }
}
