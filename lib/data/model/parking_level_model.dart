import 'package:century_mobile/domain/entities/parking_level.dart';

class ParkingLevelModel extends ParkingLevel {

  final String floorName;
  final String floorImage;

  ParkingLevelModel({
    this.floorName,
    this.floorImage,
  }) : super(
    floorName: floorName,
    floorImage: floorImage,
  );

  factory ParkingLevelModel.fromJson(Map<String, dynamic> json) => ParkingLevelModel(
    floorName: json["floor_name"],
    floorImage: json["floor_image"],
  );

  Map<String, dynamic> toJson() => {
    "floor_name": floorName,
    "floor_image": floorImage,
  };

}