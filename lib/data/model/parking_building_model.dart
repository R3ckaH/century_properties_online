
import 'package:century_mobile/domain/entities/parking_building.dart';

class ParkingBuildingModel extends ParkingBuilding {

  final String building;
  final String buildingName;    

  ParkingBuildingModel({    
      this.building,
      this.buildingName,
    }) : super(
        building: building,
        buildingName: buildingName,
    );

  factory ParkingBuildingModel.fromJson(Map<String, dynamic> json) => ParkingBuildingModel(
        building: json["building"],
        buildingName: json["building_name"],
      );

  Map<String, dynamic> toJson() => {
        "building": building,
        "building_name": buildingName,
      };

}