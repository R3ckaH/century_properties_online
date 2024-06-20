import 'package:century_mobile/core/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../dependency_injector.dart';
import '../cubit/authentication/authentication_cubit.dart';
import '../cubit/login/login_cubit.dart';
import 'login_screen.dart';
import 'main_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  AuthenticationScreen({Key key}) : super(key: key);

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  @override
  void dispose() {
    sl<AuthenticationCubit>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
      if (state is Authenticated) {
        GLOBAL_USERNAME = state.user.username;
        return MainScreen();
      } else if (state is Unauthenticated) {
        return BlocProvider(
          create: (context) => sl<LoginCubit>(),
          child: LoginScreen(),
        );
      }
      return Container();
    });
  }
}
