part of 'pdflink_cubit.dart';

abstract class PdflinkState extends Equatable {
  const PdflinkState();

  @override
  List<Object> get props => [];
}

class PdflinkInitial extends PdflinkState {}

class PdflinkLoading extends PdflinkState {}

class PdflinkLoaded extends PdflinkState {
  final String link;

  PdflinkLoaded(this.link);
  @override
  List<Object> get props => [link];
}

class PdflinkError extends PdflinkState {
  final String message;

  PdflinkError(this.message);
  @override
  List<Object> get props => [message];
}
