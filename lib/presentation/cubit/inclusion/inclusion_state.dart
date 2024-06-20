part of 'inclusion_cubit.dart';

abstract class InclusionState extends Equatable {
  const InclusionState();

  @override
  List<Object> get props => [];
}

class InclusionInitial extends InclusionState {}

class InclusionError extends InclusionState {
  final String message;

  InclusionError(this.message);
  @override
  List<Object> get props => [message];
}

class InclusionLoading extends InclusionState {}

class InclusionLoaded extends InclusionState {
  final List<Inclusion> specs;

  InclusionLoaded(this.specs);

  @override
  List<Object> get props => [specs];
}
