import 'package:century_mobile/core/call/usecase.dart';
import 'package:century_mobile/core/error/failure.dart';
import 'package:century_mobile/domain/entities/parking_building.dart';
import 'package:century_mobile/domain/repositories/century_properties_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class GetParkingBuildings implements UseCase<List<ParkingBuilding>, GetParkingBuildingParams> {
  final CenturyPropertiesRepository _repo;

  GetParkingBuildings(this._repo);

  @override
  Future<Either<Failure, List<ParkingBuilding>>> call(GetParkingBuildingParams params) async =>
      await _repo.getParkingBuildings(projectID: params.projectId);
}

class GetParkingBuildingParams extends Equatable {
  final String projectId;

  GetParkingBuildingParams({@required this.projectId});

  @override
  List<Object> get props => [projectId];
}
