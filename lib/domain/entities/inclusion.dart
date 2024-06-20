import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Inclusion extends Equatable {
  Inclusion({
    @required this.areaDesc,
    @required this.areaDeliverable,
    @required this.unitType,
  });

  final String areaDesc;
  final String areaDeliverable;
  final String unitType;

  @override
  List<Object> get props => [areaDesc, areaDeliverable, unitType];
}
