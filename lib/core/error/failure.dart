import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class LoginFailure extends Failure {
  final String message;

  LoginFailure(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  final String message;

  ServerFailure(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => message;
}

class CacheFailure extends Failure {
  final String message;

  CacheFailure(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => message;
}
