import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_v2/feature/home/domain/entity/bio_entity.dart';
import 'package:portfolio_v2/feature/home/domain/use_cases/bio_use_case.dart';

part 'bio_event.dart';
part 'bio_state.dart';

class BioBloc extends Bloc<BioEvent, BioState> {
  final BioUseCase getBio;
  BioBloc(this.getBio) : super(BioInitial()) {
    on<BioEvent>((event, emit) async {
      emit(BioLoading());
      final result = await getBio();
      result.match(
        (failure) => emit(BioError(failure.message)),
        (bio) => emit(BioLoaded(bio)),
      );
    });
  }
}
