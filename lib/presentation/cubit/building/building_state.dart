part of 'building_cubit.dart';

abstract class BuildingState extends Equatable {
  const BuildingState();

  @override
  List<Object> get props => [];
}

class BuildingInitial extends BuildingState {}

class BuildingLoading extends BuildingState {}

class BuildingLoaded extends BuildingState {
  final List<Building> buildings;

  BuildingLoaded(this.buildings);

  @override
  List<Object> get props => [buildings];
}

class BuildingError extends BuildingState {
  final String message;

  BuildingError(this.message);
  @override
  List<Object> get props => [message];
}
