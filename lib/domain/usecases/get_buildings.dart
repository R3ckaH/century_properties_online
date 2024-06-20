import 'package:century_mobile/core/call/usecase.dart';
import 'package:century_mobile/core/error/failure.dart';
import 'package:century_mobile/domain/entities/building.dart';
import 'package:century_mobile/domain/repositories/century_properties_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetBuildings implements UseCase<List<Building>, GetBuildingsParams> {
  final CenturyPropertiesRepository _repo;

  GetBuildings(this._repo);

  @override
  Future<Either<Failure, List<Building>>> call(
          GetBuildingsParams params) async =>
      await _repo.getBuildings(projectId: params.projectId);
}

class GetBuildingsParams extends Equatable {
  final String projectId;

  GetBuildingsParams(this.projectId);
  @override
  List<Object> get props => [projectId];
}
