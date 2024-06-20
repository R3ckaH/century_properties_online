import '../../domain/usecases/login.dart';
import '../cubit/authentication/authentication_cubit.dart';
import '../cubit/login/login_cubit.dart';
import '../widgets/components/_components.dart';
import '../widgets/components/custom_text_lato.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController;
  TextEditingController passwordController;
  bool showPassword = true;
  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.asset(
              'images/login.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'images/century_logo.png',
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      CustomTextLato(
                        'CENTURY ONLINE',
                        color: Colors.white,
                        size: 10.0.sp,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          if (state is LoginError) {
                            return TextField(
                              controller: usernameController,
                              style: GoogleFonts.lato(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                errorText: state.message,
                                focusColor: Colors.white,
                                hoverColor: Colors.white,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                labelText: 'USERNAME',
                                labelStyle: GoogleFonts.lato(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          } else if (state is LoginUsernameError) {
                            return TextField(
                              controller: usernameController,
                              style: GoogleFonts.lato(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                errorText: state.message,
                                focusColor: Colors.white,
                                hoverColor: Colors.white,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                labelText: 'USERNAME',
                                labelStyle: GoogleFonts.lato(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }
                          return TextField(
                            controller: usernameController,
                            style: GoogleFonts.lato(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              focusColor: Colors.white,
                              hoverColor: Colors.white,
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                              ),
                              border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                              ),
                              labelText: 'USERNAME',
                              labelStyle: GoogleFonts.lato(
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          if (state is LoginError) {
                            return TextField(
                              obscureText: showPassword,
                              controller: passwordController,
                              style: GoogleFonts.lato(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                suffix: IconButton(
                                  icon: FaIcon(
                                    showPassword
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                ),
                                errorText: state.message,
                                focusColor: Colors.white,
                                hoverColor: Colors.white,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                labelText: 'PASSWORD',
                                labelStyle: GoogleFonts.lato(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          } else if (state is LoginPasswordError) {
                            return TextField(
                              obscureText: showPassword,
                              controller: passwordController,
                              style: GoogleFonts.lato(color: Colors.white),
                              cursorColor: Colors.white,
                              decoration: InputDecoration(
                                suffix: IconButton(
                                  icon: FaIcon(
                                    showPassword
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                ),
                                errorText: state.message,
                                focusColor: Colors.white,
                                hoverColor: Colors.white,
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.white, width: 2),
                                ),
                                labelText: 'PASSWORD',
                                labelStyle: GoogleFonts.lato(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }
                          return TextField(
                            obscureText: showPassword,
                            controller: passwordController,
                            style: GoogleFonts.lato(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              suffix: IconButton(
                                icon: FaIcon(
                                  showPassword
                                      ? FontAwesomeIcons.eye
                                      : FontAwesomeIcons.eyeSlash,
                                  size: 16,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    showPassword = !showPassword;
                                  });
                                },
                              ),
                              focusColor: Colors.white,
                              hoverColor: Colors.white,
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                              ),
                              border: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 2),
                              ),
                              labelText: 'PASSWORD',
                              labelStyle: GoogleFonts.lato(
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: CustomTextLato(
                          'Forgot password?',
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                          if (state is LoginSuccess) {
                            usernameController.clear();
                            passwordController.clear();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.white,
                                content: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomTextLato(
                                      state.user.message,
                                    ),
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                    )
                                  ],
                                )));
                            context.read<AuthenticationCubit>().logsCheck();
                          }
                        },
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return Center(
                              child: Opacity(
                                opacity: 0.8,
                                child: Container(
                                  height: 50,
                                  width: double.infinity ?? 70.0.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(1 ?? 8),
                                  ),
                                  child: CustomLoading(),
                                ),
                              ),
                            );
                          }
                          return CustomButtonText(
                            'LOGIN',
                            onTap: () => context.read<LoginCubit>().login(
                                LoginParams(
                                    username: usernameController.text,
                                    password: passwordController.text)),
                            radius: 1,
                            color: Colors.white,
                            textColor: Colors.black,
                            width: double.infinity,
                          );
                        },
                      ),
                    ],
                  ),
                  CustomTextLato(
                    '© Copyright 2019 - Century Properties, Inc. - All Rights Reserved.',
                    size: 8.0.sp,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
