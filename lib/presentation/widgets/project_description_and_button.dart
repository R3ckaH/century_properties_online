import 'package:century_mobile/core/constant/color.dart';
import 'package:century_mobile/presentation/cubit/building/building_cubit.dart';
import 'package:century_mobile/presentation/screens/available_units_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sizer/sizer.dart';

import '../../domain/entities/project.dart';
import 'components/_components.dart';

class ProjectDescriptionAndButton extends StatefulWidget {
  const ProjectDescriptionAndButton({
    Key key,
    @required this.item,
  }) : super(key: key);

  final Project item;

  @override
  _ProjectDescriptionAndButtonState createState() =>
      _ProjectDescriptionAndButtonState();
}

class _ProjectDescriptionAndButtonState
    extends State<ProjectDescriptionAndButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextLato(
          widget.item.projectName,
          size: 10.0.sp,
          weight: FontWeight.bold,
        ),
        SizedBox(
          height: 1.0.h,
        ),
        CustomTextLato(
          widget.item.projectDescription,
          spacing: 1.7,
          size: 8.0.sp,
        ),
        SizedBox(
          height: 25,
        ),
        BlocBuilder<BuildingCubit, BuildingState>(
          builder: (context, state) {
            if (state is BuildingLoaded) {
              return state.buildings.length != 1
                  ? Column(
                      children: state.buildings
                          .toSet()
                          .map(
                            (building) => Container(
                              margin: EdgeInsets.symmetric(vertical: 8),
                              child: CustomButtonText(
                                '${building.buildingName}',
                                onTap: () {
                                  pushNewScreen(
                                    context,
                                    screen: AvailableUnitsScreen(
                                      item: building,
                                    ),
                                    withNavBar:
                                        true, // OPTIONAL VALUE. True by default.
                                    pageTransitionAnimation:
                                        PageTransitionAnimation.fade,
                                  );
                                },
                                color: CPColors.grey,
                              ),
                            ),
                          )
                          .toList(),
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: CustomButtonText(
                        'VIEW AVAILABLE UNITS',
                        onTap: () {
                          pushNewScreen(
                            context,
                            screen: AvailableUnitsScreen(
                              item: state.buildings.first,
                            ),
                            withNavBar:
                                true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.fade,
                          );
                        },
                        color: CPColors.grey,
                      ),
                    );
            }
            return CustomLoading();
          },
        ),
        // CustomButtonText(
        //   'VIEW AVAILABLE UNITS',
        //   onTap: () {
        //     pushNewScreen(
        //       context,
        //       screen: AvailableUnitsScreen(
        //         item: item,
        //       ),
        //       withNavBar: true, // OPTIONAL VALUE. True by default.
        //       pageTransitionAnimation: PageTransitionAnimation.fade,
        //     );
        //   },
        //   color: CPColors.grey,
        // ),
      ],
    );
  }
}
