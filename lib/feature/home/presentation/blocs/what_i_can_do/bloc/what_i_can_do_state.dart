part of 'what_i_can_do_bloc.dart';

@immutable
sealed class WhatICanDoState {}

final class WhatICanDoInitial extends WhatICanDoState {}

class WhatIcanDoLoading extends WhatICanDoState {}

class WhatIcanDoLoaded extends WhatICanDoState {
  final List<WhatICanDoEntity> getCards;
  WhatIcanDoLoaded(this.getCards);
}

class WhatIcanDoError extends WhatICanDoState {
  final String message;

  WhatIcanDoError(this.message);
}
