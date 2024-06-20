import 'package:century_mobile/domain/entities/building.dart';

class BuildingModel extends Building {
  BuildingModel({
    this.project,
    this.building,
    this.buildingName,
    this.coverPhoto,
  }) : super(
            building: building,
            buildingName: buildingName,
            coverPhoto: coverPhoto,
            project: project);

  final String project;
  final String building;
  final String buildingName;
  final String coverPhoto;

  factory BuildingModel.fromJson(Map<String, dynamic> json) => BuildingModel(
        project: json["project"],
        building: json["building"],
        buildingName: json["building_name"],
        coverPhoto: json["cover_photo"],
      );

  Map<String, dynamic> toJson() => {
        "project": project,
        "building": building,
        "building_name": buildingName,
        "cover_photo": coverPhoto,
      };
}
