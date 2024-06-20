import 'package:equatable/equatable.dart';

class ParkingBuilding extends Equatable {
  ParkingBuilding({
    this.building,
    this.buildingName,
  });

  final String building;
  final String buildingName;

  @override
  List<Object> get props => [building, buildingName];
}
