import 'package:century_mobile/core/call/usecase.dart';
import 'package:century_mobile/core/error/failure.dart';
import 'package:century_mobile/domain/entities/parking_slot.dart';
import 'package:century_mobile/domain/repositories/century_properties_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetParkingSlots implements UseCase<List<ParkingSlot>, GetParkingSlotParams> {
  final CenturyPropertiesRepository _repo;

  GetParkingSlots(this._repo);

  @override
  Future<Either<Failure, List<ParkingSlot>>> call(GetParkingSlotParams params) async =>
      await _repo.getParkingSlots(building: params.building, floorName: params.floorName);
}

class GetParkingSlotParams extends Equatable {
  final String building;
  final String floorName;

  GetParkingSlotParams({this.building, this.floorName});

  @override
  List<Object> get props => [building, floorName];
}
