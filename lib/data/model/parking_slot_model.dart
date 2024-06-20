import 'package:century_mobile/domain/entities/parking_slot.dart';

class ParkingSlotModel extends ParkingSlot {

  final String slotId;
  final String slotName;

  ParkingSlotModel({
    this.slotId,
    this.slotName,
  }) : super(
    slotId: slotId,
    slotName: slotName,
  );

  factory ParkingSlotModel.fromJson(Map<String, dynamic> json) => ParkingSlotModel(
    slotId: json["slot_id"].toString(),
    slotName: json["slot_name"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "slot_id": slotId,
    "slot_name": slotName,
  };

}