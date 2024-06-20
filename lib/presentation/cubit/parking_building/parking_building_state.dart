part of 'parking_building_cubit.dart';

abstract class ParkingBuildingState extends Equatable {
  const ParkingBuildingState();
  @override
  List<Object> get props => [];

}

class ParkingBuildingInitial extends ParkingBuildingState {}

class ParkingBuildingLoading extends ParkingBuildingState{}

class ParkingBuildingLoaded extends ParkingBuildingState{
  final List<ParkingBuilding> parkingBuildings;

  ParkingBuildingLoaded(this.parkingBuildings);
  @override
  List<Object> get props => [parkingBuildings];
}

class ParkingBuildingError extends ParkingBuildingState {
  final String message;

  ParkingBuildingError(this.message);

  @override
  List<Object> get props => [message];
}