import 'package:century_mobile/core/call/usecase.dart';
import 'package:century_mobile/core/error/failure.dart';
import 'package:century_mobile/domain/entities/parking_level.dart';
import 'package:century_mobile/domain/repositories/century_properties_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class GetParkingLevels implements UseCase<List<ParkingLevel>, GetParkingLevelParams> {
  final CenturyPropertiesRepository _repo;

  GetParkingLevels(this._repo);

  @override
  Future<Either<Failure, List<ParkingLevel>>> call(GetParkingLevelParams params) async =>
      await _repo.getParkingLevels(building: params.building);
}

class GetParkingLevelParams extends Equatable {
  final String building;

  GetParkingLevelParams({@required this.building});

  @override
  List<Object> get props => [building];
}
