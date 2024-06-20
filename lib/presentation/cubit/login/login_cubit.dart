import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/user.dart';
import '../../../domain/usecases/login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._login) : super(LoginInitial());

  final Login _login;

  void login(LoginParams params) async {
    emit(LoginLoading());

    if (params.username.isEmpty && params.password.isEmpty) {
      emit(LoginError('Fill the blank'));
    } else if (params.username.isEmpty) {
      emit(LoginUsernameError('Username is Empty'));
    } else if (params.password.isEmpty) {
      emit(LoginPasswordError('Password is Empty'));
    } else {
      final _eitherUserOrFailure = await _login(params);

      _eitherUserOrFailure.fold((fail) => emit(LoginError(fail.toString())),
          (user) => emit(LoginSuccess(user)));
    }
  }
}
