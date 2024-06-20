part of 'parking_level_cubit.dart';

abstract class ParkingLevelState extends Equatable {
  const ParkingLevelState();
  @override
  List<Object> get props => [];

}

class ParkingLevelInitial extends ParkingLevelState {}

class ParkingLevelLoading extends ParkingLevelState{}

class ParkingLevelLoaded extends ParkingLevelState{
  final List<ParkingLevel> parkingLevels;

  ParkingLevelLoaded(this.parkingLevels);
  @override
  List<Object> get props => [parkingLevels];
}

class ParkingLevelError extends ParkingLevelState {
  final String message;

  ParkingLevelError(this.message);

  @override
  List<Object> get props => [message];
}