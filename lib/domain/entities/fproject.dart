import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class FeatureProject extends Equatable {
  final String imgSrc;
  final String title;
  final String imgLogoSrc;
  final List<String> imgSrcList;
  final List<ProjectUnit> unitList;
  final List<Room> imgRoomList;
  final String projectDescription;
  FeatureProject({
    @required this.imgSrc,
    @required this.title,
    @required this.unitList,
    @required this.imgLogoSrc,
    @required this.imgSrcList,
    @required this.imgRoomList,
    @required this.projectDescription,
  });

  @override
  List<Object> get props {
    return [
      imgSrc,
      title,
      imgLogoSrc,
      imgSrcList,
      unitList,
      projectDescription,
    ];
  }
}

class Room extends Equatable {
  final String title;
  final String imgSrc;

  Room({
    @required this.title,
    @required this.imgSrc,
  });

  @override
  List<Object> get props => [title, imgSrc];
}

class ProjectUnit extends Equatable {
  final String title;
  final String unitCode;
  final String unitType;
  final String floorArea;
  final double price;
  final String imgSrc;
  final List<StandardSpecification> standardList;
  final List<FullyFittedSpecification> fullyFittedList;
  ProjectUnit({
    @required this.title,
    @required this.unitCode,
    @required this.price,
    @required this.floorArea,
    @required this.unitType,
    @required this.imgSrc,
    @required this.standardList,
    @required this.fullyFittedList,
  });

  @override
  List<Object> get props {
    return [
      title,
      unitCode,
      unitType,
      floorArea,
      price,
      imgSrc,
      standardList,
      fullyFittedList,
    ];
  }
}

class StandardSpecification extends Equatable {
  final String category;
  final List<String> specs;
  StandardSpecification({
    @required this.category,
    @required this.specs,
  });

  @override
  List<Object> get props => [category, specs];
}

class FullyFittedSpecification extends Equatable {
  final String category;
  final List<String> specs;
  FullyFittedSpecification({
    @required this.category,
    @required this.specs,
  });

  @override
  List<Object> get props => [category, specs];
}
