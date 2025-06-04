import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_v2/feature/home/domain/entity/what_i_can_do_entity.dart';
import 'package:portfolio_v2/feature/home/domain/use_cases/what_i_can_do_use_case.dart';
part 'what_i_can_do_event.dart';
part 'what_i_can_do_state.dart';

class WhatICanDoBloc extends Bloc<WhatICanDoEvent, WhatICanDoState> {
  final WhatICanDoUseCase getCards;
  WhatICanDoBloc(this.getCards) : super(WhatICanDoInitial()) {
    on<WhatICanDoEvent>((event, emit) async {
      emit(WhatIcanDoLoading());
      final result = await getCards();
      result.match(
        (failure) => emit(WhatIcanDoError(failure.message)),
        (cards) => emit(WhatIcanDoLoaded(cards)),
      );
    });
  }
}
