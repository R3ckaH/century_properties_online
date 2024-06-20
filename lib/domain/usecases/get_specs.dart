import '../../core/call/usecase.dart';
import '../../core/error/failure.dart';
import '../entities/inclusion.dart';
import '../repositories/century_properties_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetSpecs implements UseCase<List<Inclusion>, GetSpecsParams> {
  final CenturyPropertiesRepository _repo;

  GetSpecs(this._repo);

  @override
  Future<Either<Failure, List<Inclusion>>> call(GetSpecsParams params) async =>
      await _repo.getSpecs(unitID: params.unitID);
}

class GetSpecsParams extends Equatable {
  final String unitID;

  GetSpecsParams(this.unitID);
  @override
  List<Object> get props => [unitID];
}
