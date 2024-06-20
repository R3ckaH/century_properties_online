import 'package:bloc/bloc.dart';
import '../../../core/call/usecase.dart';
import '../../../domain/entities/project.dart';
import '../../../domain/usecases/get_projects.dart';
import 'package:equatable/equatable.dart';
part 'project_state.dart';

class ProjectCubit extends Cubit<ProjectState> {
  ProjectCubit(this._getProjects) : super(ProjectInitial());

  final GetProjects _getProjects;

  void loadInitialData() async {
    emit(ProjectLoading());
    final _eitherProjectListOrFailure = await _getProjects(NoParams());

    _eitherProjectListOrFailure.fold(
      (error) => emit(ProjectError(error.toString())),
      (projects) => emit(ProjectLoaded(projects)),
    );
  }
}
