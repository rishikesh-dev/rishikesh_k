import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_v2/feature/home/domain/entity/project_entity.dart';
import 'package:portfolio_v2/feature/home/domain/use_cases/projects_use_case.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final ProjectsUseCase getProjects;
  ProjectBloc(this.getProjects) : super(ProjectInitial()) {
    on<ProjectEvent>((event, emit) async {
      emit(ProjectLoading());
      final result = await getProjects();
      result.match(
        (failure) => emit(ProjectError(failure.message)),
        (projects) => emit(ProjectLoaded(projects)),
      );
    });
  }
}
