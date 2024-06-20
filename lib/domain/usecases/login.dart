import '../../core/call/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../core/error/failure.dart';
import '../entities/user.dart';
import '../repositories/century_properties_repository.dart';

class Login implements UseCase<User, LoginParams> {
  final CenturyPropertiesRepository _repo;

  Login(this._repo);

  @override
  Future<Either<Failure, User>> call(LoginParams params) async {
    return await _repo.login(
        username: params.username, password: params.password);
  }
}

class LoginParams extends Equatable {
  final String username;
  final String password;

  LoginParams({@required this.username, @required this.password});

  @override
  List<Object> get props => [username, password];
}
