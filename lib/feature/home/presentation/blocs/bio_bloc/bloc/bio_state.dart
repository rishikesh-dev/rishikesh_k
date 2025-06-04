part of 'bio_bloc.dart';

@immutable
sealed class BioState {}

final class BioInitial extends BioState {}

class BioLoading extends BioState {}

class BioLoaded extends BioState {
  final BioEntity bio;
  BioLoaded(this.bio);
}

class BioError extends BioState {
  final String messsage;
  BioError(this.messsage);
}
