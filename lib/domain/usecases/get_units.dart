import 'package:dartz/dartz.dart';
import '../../core/error/failure.dart';
import 'package:equatable/equatable.dart';

import '../../core/call/usecase.dart';
import '../entities/unit.dart';
import '../repositories/century_properties_repository.dart';

class GetUnits implements UseCase<List<UnitEntity>, GetUnitsParams> {
  final CenturyPropertiesRepository _repo;

  GetUnits(this._repo);

  @override
  Future<Either<Failure, List<UnitEntity>>> call(GetUnitsParams params) async =>
      await _repo.getUnits(projectID: params.projectID);
}

class GetUnitsParams extends Equatable {
  final String projectID;

  GetUnitsParams(this.projectID);

  @override
  List<Object> get props => [projectID];
}
