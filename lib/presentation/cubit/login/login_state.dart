part of 'login_cubit.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final User user;

  LoginSuccess(this.user);
  @override
  List<Object> get props => [user];
}

class LoginUsernameError extends LoginState {
  final String message;

  LoginUsernameError(this.message);

  @override
  List<Object> get props => [message];
}

class LoginPasswordError extends LoginState {
  final String message;

  LoginPasswordError(this.message);

  @override
  List<Object> get props => [message];
}

class LoginError extends LoginState {
  final String message;

  LoginError(this.message);

  @override
  List<Object> get props => [message];
}
