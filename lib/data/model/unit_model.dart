import '../../domain/entities/unit.dart';
import 'package:meta/meta.dart';

class UnitModel extends UnitEntity {
  UnitModel({
    @required this.floorPlan,
    @required this.unitPlan,
    @required this.coverPhoto,
    @required this.projectId,
    @required this.unit,
    @required this.building,
    @required this.unitType,
    @required this.unitPrice,
    @required this.unitArea,
    @required this.buildingDesc,
    @required this.floor,
    @required this.contractPrice,
    @required this.apiTermsBaseURL,
    @required this.apiScheduleBaseURL,
  }) : super(
            building: building,
            floorPlan: floorPlan,
            coverPhoto: coverPhoto,
            projectId: projectId,
            unit: unit,
            unitPlan: unitPlan,
            unitPrice: unitPrice,
            buildingDesc: buildingDesc,
            unitArea: unitArea,
            unitType: unitType,
            floor: floor,
            contractPrice : contractPrice,
            apiTermsBaseURL : apiTermsBaseURL,
            apiScheduleBaseURL : apiScheduleBaseURL,            
            );

  final String floorPlan;
  final String unitPlan;
  final String coverPhoto;
  final String projectId;
  final String unit;
  final String building;
  final String unitType;
  final double unitPrice;
  final double unitArea;
  final String buildingDesc;
  final String floor;

  final double contractPrice;
  final String apiTermsBaseURL;
  final String apiScheduleBaseURL;

  factory UnitModel.fromJson(Map<String, dynamic> json) => UnitModel(
        floorPlan: json["floor_plan"],
        unitPlan: json["unit_plan"],
        coverPhoto: json["cover_photo"],
        projectId: json["Project_ID"],
        unit: json["UNIT"],
        building: json["BUILDING"],
        buildingDesc: json["BUILDING_DESC"],
        unitArea: json["UNIT_AREA"],
        unitType: json["UNIT_TYPE"],
        unitPrice: json["UNIT_PRICE"].toDouble(),
        floor: json["FLOOR"],
        contractPrice: json["CONTRACT_PRICE"].toDouble(),
        apiTermsBaseURL: json["APITerms_BaseURL"],
        apiScheduleBaseURL: json["APISchedule_BaseURL"],
      );

  Map<String, dynamic> toJson() => {
        "floor_plan": floorPlan,
        "unit_plan": unitPlan,
        "cover_photo": coverPhoto,
        "Project_ID": projectId,
        "UNIT": unit,
        "BUILDING": building,
        "UNIT_TYPE": unitType,
        "UNIT_PRICE": unitPrice,
        "UNIT_AREA": unitArea,
        "BUILDING_DESC": buildingDesc,
        "FLOOR": floor,
        "CONTRACT_PRICE" : contractPrice,
        "APITerms_BaseURL" : apiTermsBaseURL,
        "APISchedule_BaseURL" : apiScheduleBaseURL,        
      };
}
