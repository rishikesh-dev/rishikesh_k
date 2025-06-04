import 'package:fpdart/fpdart.dart';
import 'package:portfolio_v2/core/failure/failure.dart';
import 'package:portfolio_v2/feature/home/domain/entity/bio_entity.dart';

abstract class BioRepository {
  Future<Either<Failure, BioEntity>> getDetails();
}
