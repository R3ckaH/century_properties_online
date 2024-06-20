import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../core/call/usecase.dart';
import '../../core/error/failure.dart';
import '../entities/unit.dart';
import '../repositories/century_properties_repository.dart';

class GetBuildingsItem
    implements UseCase<List<UnitEntity>, GetBuildingsItemParams> {
  final CenturyPropertiesRepository _repo;

  GetBuildingsItem(this._repo);

  @override
  Future<Either<Failure, List<UnitEntity>>> call(
      GetBuildingsItemParams params) async {
    return await _repo.getBuildingsItem(params.building);
  }
}

class GetBuildingsItemParams extends Equatable {
  final String building;

  GetBuildingsItemParams(this.building);

  @override
  List<Object> get props => [building];
}
