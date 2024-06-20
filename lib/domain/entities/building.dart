import 'package:equatable/equatable.dart';

class Building extends Equatable {
  Building({
    this.project,
    this.building,
    this.buildingName,
    this.coverPhoto,
  });

  final String project;
  final String building;
  final String buildingName;
  final String coverPhoto;

  @override
  List<Object> get props => [building];
}
