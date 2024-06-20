import '../../core/call/usecase.dart';
import '../../core/error/failure.dart';
import '../entities/project.dart';
import '../repositories/century_properties_repository.dart';
import 'package:dartz/dartz.dart';

class GetProjects implements UseCase<List<Project>, NoParams> {
  final CenturyPropertiesRepository _repo;

  GetProjects(this._repo);

  @override
  Future<Either<Failure, List<Project>>> call(NoParams params) async =>
      await _repo.getProjects();
}
