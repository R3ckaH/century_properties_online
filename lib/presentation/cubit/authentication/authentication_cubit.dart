import 'package:bloc/bloc.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecases/get_user.dart';
import '../../../domain/usecases/is_logged_in.dart';
import '../../../domain/usecases/log_out.dart';
import 'package:equatable/equatable.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit(this._isLoggedIn, this._user, this._logOut)
      : super(AuthenticationInitial());

  final IsLoggedIn _isLoggedIn;
  final GetUser _user;
  final Logout _logOut;
  void logsCheck() async {
    final isLoggedIn = _isLoggedIn();
    (isLoggedIn) ? emit(Authenticated(_user())) : emit(Unauthenticated());
  }

  void logOut() async {
    emit(Authenticating());
    await _logOut.call();
    emit(Unauthenticated());
  }
}
