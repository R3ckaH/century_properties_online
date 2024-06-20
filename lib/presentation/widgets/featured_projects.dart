import 'package:century_mobile/dependency_injector.dart';
import 'package:century_mobile/presentation/cubit/building/building_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sizer/sizer.dart';

import '../../domain/entities/project.dart';
import '../screens/projects_screen.dart';
import 'components/_components.dart';

class FeaturedProjects extends StatelessWidget {
  const FeaturedProjects({
    @required this.list,
    Key key,
  }) : super(key: key);
  final List<Project> list;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: list
          .map((item) => GestureDetector(
                onTap: () => pushNewScreen(
                  context,
                  screen: BlocProvider.value(
                    value: sl<BuildingCubit>()..getBuildings(item.projectId),
                    child: ProjectsScreen(
                      item: item,
                    ),
                  ),
                  withNavBar: true, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.fade,
                ),
                child: Container(
                  width: 45.0.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 0.8.h, vertical: 2.0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 4,
                                  spreadRadius: 2,
                                  offset: Offset(0, -4), // Shadow position
                                ),
                              ],
                            ),
                            child: Image.network(
                              item.bannerUrl,
                              height: 20.0.h,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) => Image.asset(
                                'images/default_image.jpg',
                                fit: BoxFit.cover,
                              ),
                              isAntiAlias: true,
                            ),
                          ),
                          // Positioned(
                          //   bottom: 10,
                          //   left: 10,
                          //   child: Container(
                          //     height: 32,
                          //     width: 100,
                          //     child: Image.asset(
                          //             'images/azure_sample.png') ??
                          //         Placeholder(
                          //           color: Colors.white,
                          //         ),
                          //   ),
                          // )
                        ],
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      CustomTextLato(
                        item.projectName ?? 'Default Name',
                        size: 7.0.sp,
                      )
                    ],
                  ),
                ),
              ))
          .toList(),
    );
  }
}
