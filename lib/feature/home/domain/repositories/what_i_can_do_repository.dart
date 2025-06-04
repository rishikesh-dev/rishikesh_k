import 'package:fpdart/fpdart.dart';
import 'package:portfolio_v2/core/failure/failure.dart';
import 'package:portfolio_v2/feature/home/data/models/what_i_can_do_model.dart';

abstract class WhatICanDoRepository {
  Future<Either<Failure, List<WhatICanDoModel>>> getCards();
}
