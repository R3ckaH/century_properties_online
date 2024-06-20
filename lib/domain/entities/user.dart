import 'package:equatable/equatable.dart';

class User extends Equatable {
  User({
    this.username,
    this.departmentId,
    this.roleId,
    this.isVp,
    this.loginType,
    this.message,
  });

  final String username;
  final String departmentId;
  final String roleId;
  final String isVp;
  final String loginType;
  final String message;

  @override
  List<Object> get props {
    return [
      username,
      departmentId,
      roleId,
      isVp,
      loginType,
      message,
    ];
  }
}
