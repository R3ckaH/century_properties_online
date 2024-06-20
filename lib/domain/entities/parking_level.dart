import 'package:equatable/equatable.dart';

class ParkingLevel extends Equatable {
  ParkingLevel({
    this.floorName,
    this.floorImage,
  });

  final String floorName;
  final String floorImage;

  @override
  List<Object> get props => [floorName, floorImage];
}
