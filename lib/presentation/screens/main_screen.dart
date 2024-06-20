import 'dart:io';

import 'package:century_mobile/presentation/cubit/building/building_cubit.dart';
import 'package:century_mobile/presentation/cubit/parking_building/parking_building_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constant/color.dart';
import '../../dependency_injector.dart' as di;
import '../cubit/live_view/live_view_cubit.dart';
import '../cubit/project/project_cubit.dart';
import '../cubit/unit/unit_cubit.dart';
import '../widgets/components/custom_text_lato.dart';
import '_screens.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    // to hide only bottom bar:

    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Widget> buildScreens() {
    return [
      HomeScreen(),
      SearchScreen(),
      AboutUsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LiveViewCubit>(
            create: (context) => LiveViewCubit(),
          ),
          BlocProvider<ProjectCubit>(
            create: (context) => di.sl<ProjectCubit>()..loadInitialData(),
          ),
          BlocProvider<UnitCubit>(
            create: (context) => di.sl<UnitCubit>(),
          ),
          BlocProvider<ParkingBuildingCubit>(
            create: (context) => di.sl<ParkingBuildingCubit>(),
          ),
          BlocProvider<BuildingCubit>(
            create: (context) => di.sl<BuildingCubit>(),
          ),
        ],
        child: WillPopScope(
          onWillPop: () => showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: CustomTextLato('Are you sure?'),
              content: CustomTextLato('You are going to exit the application'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: CustomTextLato('NO'),
                ),
                TextButton(
                  onPressed: () => exit(0),
                  child: CustomTextLato(
                    'YES',
                    color: CPColors.green,
                  ),
                ),
              ],
            ),
          ),
          child: Scaffold(
            body: PersistentTabView(
              context,
              controller: _controller,
              screens: buildScreens(),
              items: [
                PersistentBottomNavBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeColorPrimary: CPColors.darkGrey,
                  title: 'Home',
                  inactiveColorPrimary: Colors.grey,
                  textStyle: GoogleFonts.lato(fontSize: 10),
                ),
                PersistentBottomNavBarItem(
                  icon: Icon(Icons.search),
                  activeColorPrimary: CPColors.darkGrey,
                  title: 'Search',
                  inactiveColorPrimary: Colors.grey,
                  textStyle: GoogleFonts.lato(fontSize: 10),
                ),
                PersistentBottomNavBarItem(
                  onPressed: (_) async {
                    const url = 'https://www.century-properties.com/about-us/';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  icon: Icon(Icons.info_outline),
                  activeColorPrimary: CPColors.darkGrey,
                  title: 'About',
                  inactiveColorPrimary: Colors.grey,
                  textStyle: GoogleFonts.lato(fontSize: 10),
                ),
              ],
              confineInSafeArea: true,
              backgroundColor: Colors.white,
              handleAndroidBackButtonPress: true,
              resizeToAvoidBottomInset:
                  true, // This needs to be true if you want to move up the screen when keyboard appears.
              stateManagement: true,
              decoration: NavBarDecoration(
                //borderRadius: BorderRadius.circular(10.0),
                colorBehindNavBar: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              popAllScreensOnTapOfSelectedTab: true,
              popActionScreens: PopActionScreensType.all,
              itemAnimationProperties: ItemAnimationProperties(
                duration: Duration(milliseconds: 200),
                curve: Curves.ease,
              ),
              screenTransitionAnimation: ScreenTransitionAnimation(
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds: 200),
              ),
              navBarStyle: NavBarStyle.style2,
            ),
          ),
        ));
  }
}
