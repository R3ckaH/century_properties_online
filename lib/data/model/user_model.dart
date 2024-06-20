import 'dart:convert';

import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    this.username,
    this.departmentId,
    this.roleId,
    this.isVp,
    this.loginType,
    this.message,
  }) : super(
          departmentId: departmentId,
          isVp: isVp,
          loginType: loginType,
          message: message,
          roleId: roleId,
          username: username,
        );

  final String username;
  final String departmentId;
  final String roleId;
  final String isVp;
  final String loginType;
  final String message;

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'departmentId': departmentId,
      'roleId': roleId,
      'isVp': isVp,
      'loginType': loginType,
      'message': message,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'],
      departmentId: map['departmentId'],
      roleId: map['roleId'],
      isVp: map['isVp'],
      loginType: map['loginType'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
