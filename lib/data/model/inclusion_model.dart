import '../../domain/entities/inclusion.dart';
import 'package:meta/meta.dart';

class InclusionModel extends Inclusion {
  InclusionModel({
    @required this.areaDesc,
    @required this.areaDeliverable,
    @required this.unitType,
  }) : super(
            areaDeliverable: areaDeliverable,
            areaDesc: areaDesc,
            unitType: unitType);

  final String areaDesc;
  final String areaDeliverable;
  final String unitType;

  factory InclusionModel.fromJson(Map<String, dynamic> json) => InclusionModel(
        areaDesc: json["Area_Desc"],
        areaDeliverable: json["Area_Deliverable"],
        unitType: json["Unit_Type"],
      );

  Map<String, dynamic> toJson() => {
        "Area_Desc": areaDesc,
        "Area_Deliverable": areaDeliverable,
        "Unit_Type": unitType,
      };
}
