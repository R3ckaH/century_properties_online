import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UnitEntity extends Equatable {
  UnitEntity({
    @required this.floorPlan,
    @required this.unitPlan,
    @required this.coverPhoto,
    @required this.projectId,
    @required this.unit,
    @required this.unitType,
    @required this.unitPrice,
    @required this.building,
    @required this.unitArea,
    @required this.buildingDesc,
    @required this.floor,
    @required this.contractPrice,
    @required this.apiTermsBaseURL,
    @required this.apiScheduleBaseURL,
  });

  final String floorPlan;
  final String unitPlan;
  final String coverPhoto;
  final String projectId;
  final String unit;
  final String building;
  final String buildingDesc;
  final String unitType;
  final double unitPrice;
  final double unitArea;
  final String floor;

  final double contractPrice;
  final String apiTermsBaseURL;
  final String apiScheduleBaseURL;

  @override
  List<Object> get props => [unitType];
}
