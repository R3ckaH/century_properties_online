part of 'parking_slot_cubit.dart';

abstract class ParkingSlotState extends Equatable {
  const ParkingSlotState();
  @override
  List<Object> get props => [];

}

class ParkingSlotInitial extends ParkingSlotState {}

class ParkingSlotLoading extends ParkingSlotState{}

class ParkingSlotLoaded extends ParkingSlotState{
  final List<ParkingSlot> parkingSlots;

  ParkingSlotLoaded(this.parkingSlots);
  @override
  List<Object> get props => [parkingSlots];
}

class ParkingSlotError extends ParkingSlotState {
  final String message;

  ParkingSlotError(this.message);

  @override
  List<Object> get props => [message];
}