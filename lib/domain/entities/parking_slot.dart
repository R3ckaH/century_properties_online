import 'package:equatable/equatable.dart';

class ParkingSlot extends Equatable {
  ParkingSlot({
    this.slotId,
    this.slotName,
  });

  final String slotId;
  final String slotName;

  @override
  List<Object> get props => [slotId, slotName];
}