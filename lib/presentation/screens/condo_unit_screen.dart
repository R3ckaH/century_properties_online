import 'package:century_mobile/presentation/cubit/parking_building/parking_building_cubit.dart';
import 'package:century_mobile/presentation/cubit/parking_level/parking_level_cubit.dart';
import 'package:century_mobile/presentation/cubit/parking_slot/parking_slot_cubit.dart';
import 'package:century_mobile/presentation/cubit/payment_option/payment_option_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sizer/sizer.dart';

import '../../core/constant/color.dart';
import '../../core/utils/converter.dart';
import '../../dependency_injector.dart';
import '../../domain/entities/unit.dart';
import '../cubit/inclusion/inclusion_cubit.dart';
import '../widgets/_widgets.dart';
import '../widgets/components/_components.dart';
import 'payment_option_screen.dart';

class CondoUnitScreen extends StatelessWidget {
  CondoUnitScreen({
    Key key,
    @required this.unit,
  }) : super(key: key);
  final UnitEntity unit;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TopCarousel(
                    images: [unit.unitPlan, unit.floorPlan],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextLato(
                          unit.buildingDesc,
                          size: 10.0.sp,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextLato(
                              unit.unit,
                              size: 8.0.sp,
                            ),
                            CustomTextLato(
                              'Unit Code',
                              size: 7.0.sp,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextLato(
                              unit.unitType,
                              size: 8.0.sp,
                            ),
                            CustomTextLato(
                              'Unit Type',
                              size: 7.0.sp,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextLato(
                              unit.unitArea.toString() + ' sqm',
                              size: 8.0.sp,
                            ),
                            CustomTextLato(
                              'Floor Area',
                              size: 7.0.sp,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextLato(
                              'Php ${pesosConvert(unit.unitPrice)}',
                              size: 8.0.sp,
                              weight: FontWeight.bold,
                            ),
                            CustomTextLato(
                              'Price',
                              size: 7.0.sp,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: CustomButtonText(
                                'BACK',
                                onTap: () {
                                  Navigator.pop(context);
                                  sl<InclusionCubit>().close();
                                },
                                color: CPColors.darkGrey,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: CustomButtonText(
                                'PAYMENT OPTIONS',
                                onTap: () {
                                  pushDynamicScreen(
                                    context,
                                    screen: MaterialPageRoute(
                                        builder: (_) => MultiBlocProvider(
                                              providers: [
                                                BlocProvider.value(
                                                    value: sl<
                                                        ParkingBuildingCubit>()
                                                      ..loadInitialData(
                                                          projectID:
                                                              unit.projectId)),
                                                BlocProvider.value(
                                                    value:
                                                        sl<ParkingLevelCubit>()
                                                          ..loadInitialData(
                                                              building: '')),
                                                BlocProvider.value(
                                                    value:
                                                        sl<ParkingSlotCubit>()
                                                          ..loadInitialData()),
                                                BlocProvider.value(
                                                    value: sl<
                                                        PaymentOptionCubit>()),
                                              ],
                                              child: PaymentOptionScreen(
                                                unit: unit,
                                              ),
                                            )),
                                    /*BlocProvider.value(
                                      value:
                                        sl<ParkingBuildingCubit>()..loadInitialData(projectID: unit.projectId),
                                      child: PaymentOptionScreen(
                                        unit: unit,
                                      ),
                                    ),*/

                                    /*  PaymentOptionScreen(
                                      unit: unit,
                                    ),*/
                                    withNavBar:
                                        true, // OPTIONAL VALUE. True by default.
                                    /*pageTransitionAnimation:
                                        PageTransitionAnimation.fade,*/
                                  );
                                },
                                color: CPColors.green,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        CustomTextLato(
                          'UNIT INCLUSIONS',
                          size: 11.0.sp,
                          weight: FontWeight.w800,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        BlocBuilder<InclusionCubit, InclusionState>(
                          builder: (context, state) {
                            if (state is InclusionLoading) {
                              return CustomLoading();
                            } else if (state is InclusionLoaded) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: state.specs
                                    .map(
                                      (spec) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomTextLato(
                                            spec.areaDesc ?? '',
                                            size: 10.0.sp,
                                            weight: FontWeight.bold,
                                          ),
                                          CustomTextLato(
                                            spec.areaDeliverable.replaceAll(
                                                    RegExp('<br>'), ', ') ??
                                                '',
                                            size: 10.0.sp,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    )
                                    .toList(),
                              );
                            } else if (state is InclusionError) {
                              return CustomTextLato(
                                state.message,
                                color: Colors.red,
                              );
                            }
                            return Container();
                          },
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 600,
                    width: double.infinity,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(14.48446906740719, 121.0450514661229),
                        zoom: 13.0,
                      ),
                      markers: Set.from(
                        [
                          Marker(
                            markerId: MarkerId('myLocation'),
                            position:
                                LatLng(14.48446906740719, 121.0450514661229),
                            draggable: false,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomButtonBack(),
          ],
        ),
      ),
    );
  }
}
