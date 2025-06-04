part of 'project_bloc.dart';

@immutable
sealed class ProjectState {}

final class ProjectInitial extends ProjectState {}

class ProjectLoading extends ProjectState {}

class ProjectLoaded extends ProjectState {
  final List<ProjectEntity> project;
  ProjectLoaded(this.project);
}

class ProjectError extends ProjectState {
  final String message;

  ProjectError(this.message);
}
