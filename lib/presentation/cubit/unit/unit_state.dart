part of 'unit_cubit.dart';

abstract class UnitState extends Equatable {
  const UnitState();

  @override
  List<Object> get props => [];
}

class UnitInitial extends UnitState {
  @override
  List<Object> get props => [];
}

class UnitLoading extends UnitState {
  @override
  List<Object> get props => [];
}

class UnitLoaded extends UnitState {
  final List<UnitEntity> units;

  UnitLoaded(this.units);
  @override
  List<Object> get props => [units];
}

class UnitTypeLoaded extends UnitState {
  final List<UnitEntity> units;

  UnitTypeLoaded(this.units);
  @override
  List<Object> get props => [units];
}

class UnitError extends UnitState {
  final String message;
  UnitError(this.message);
  @override
  List<Object> get props => [message];
}

class HighPriceLoaded extends UnitState {
  final List<UnitEntity> units;

  HighPriceLoaded(this.units);
  @override
  List<Object> get props => [units];
}

class LowPriceLoaded extends UnitState {
  final List<UnitEntity> units;

  LowPriceLoaded(this.units);
  @override
  List<Object> get props => [units];
}
