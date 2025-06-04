import 'package:fpdart/fpdart.dart';
import 'package:portfolio_v2/core/failure/failure.dart';
import 'package:portfolio_v2/feature/home/data/models/what_i_can_do_model.dart';
import 'package:portfolio_v2/feature/home/domain/repositories/what_i_can_do_repository.dart';

class WhatICanDoUseCase {
  WhatICanDoRepository repository;
  WhatICanDoUseCase({required this.repository});
  Future<Either<Failure, List<WhatICanDoModel>>> call() async {
    return await repository.getCards();
  }
}
