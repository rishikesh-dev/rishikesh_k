import 'package:fpdart/fpdart.dart';
import 'package:portfolio_v2/core/failure/failure.dart';
import 'package:portfolio_v2/feature/home/data/data_sources/bio_remote_data_source.dart';
import 'package:portfolio_v2/feature/home/domain/entity/bio_entity.dart';
import 'package:portfolio_v2/feature/home/domain/repositories/bio_repository.dart';

class BioRepositoryImpl extends BioRepository {
  BioRemoteDataSource remoteDataSource;
  BioRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<Failure, BioEntity>> getDetails() async {
    try {
      final bio = await remoteDataSource.getDetails();
      return right(bio);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
