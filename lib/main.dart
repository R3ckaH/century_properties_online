import 'package:century_mobile/presentation/screens/_screens.dart';

import 'presentation/cubit/authentication/authentication_cubit.dart';
import 'presentation/screens/authentication_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'dependency_injector.dart';
import 'dependency_injector.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    // SystemChrome.setEnabledSystemUIOverlays([]);
    return BlocProvider(
      create: (context) => sl<AuthenticationCubit>()..logsCheck(),
      child: MaterialApp(
          title: '',
          debugShowCheckedModeBanner: false,
          home: LayoutBuilder(
            //return LayoutBuilder
            builder: (context, constraints) {
              return OrientationBuilder(
                //return OrientationBuilder
                builder: (context, orientation) {
                  //initialize SizerUtil()
                  SizerUtil()
                      .init(constraints, orientation); //initialize SizerUtil
                  return AuthenticationScreen();
                },
              );
            },
          )),
    );
  }
}
