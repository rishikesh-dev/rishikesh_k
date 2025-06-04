// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';

import 'package:portfolio_v2/core/failure/failure.dart';
import 'package:portfolio_v2/feature/home/data/data_sources/what_i_can_do_remote_data_source.dart';
import 'package:portfolio_v2/feature/home/data/models/what_i_can_do_model.dart';
import 'package:portfolio_v2/feature/home/domain/repositories/what_i_can_do_repository.dart';

class WhatICanDoRepositoryImpl extends WhatICanDoRepository {
  WhatICanDoRemoteDataSource remoteDataSource;
  WhatICanDoRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<WhatICanDoModel>>> getCards() async {
    try {
      final projects = await remoteDataSource.getCards();
      return right(projects);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
