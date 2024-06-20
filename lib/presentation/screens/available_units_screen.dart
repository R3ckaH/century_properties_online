import 'package:century_mobile/domain/entities/building.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../core/constant/color.dart';
import '../../dependency_injector.dart';
import '../cubit/unit/unit_cubit.dart';
import '../widgets/_widgets.dart';
import '../widgets/components/_components.dart';

class AvailableUnitsScreen extends StatefulWidget {
  final Building item;
  AvailableUnitsScreen({Key key, @required this.item}) : super(key: key);

  @override
  _AvailableUnitsScreenState createState() => _AvailableUnitsScreenState();
}

class _AvailableUnitsScreenState extends State<AvailableUnitsScreen> {
  @override
  void initState() {
    context.read<UnitCubit>().loadBuildingsItem(widget.item.building);
    super.initState();
  }

  @override
  void dispose() {
    sl<UnitCubit>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   actions: [
        //     Container(
        //       margin: EdgeInsets.only(right: 10),
        //       child: CircleAvatar(
        //         backgroundColor: CPColors.darkGrey,
        //         radius: 22,
        //         child: CircleAvatar(
        //           radius: 20,
        //           backgroundImage: AssetImage('images/user_icon.png'),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<UnitCubit, UnitState>(
                    builder: (context, state) {
                      if (state is UnitLoading) {
                        return LinearProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(CPColors.green),
                          backgroundColor: Colors.white,
                        );
                      }
                      return Container();
                    },
                  ),
                  TopCarousel(
                    images: ['${widget.item.coverPhoto}'],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomTextLato(
                              widget.item.buildingName,
                              size: 10.0.sp,
                              weight: FontWeight.bold,
                            ),
                            BlocBuilder<UnitCubit, UnitState>(
                              builder: (context, state) {
                                if (state is UnitLoaded) {
                                  return CustomFilterButton(
                                    units: state.units,
                                  );
                                } else if (state is HighPriceLoaded) {
                                  return CustomFilterButton(
                                    units: state.units,
                                  );
                                } else if (state is LowPriceLoaded) {
                                  return CustomFilterButton(
                                    units: state.units,
                                  );
                                }
                                return Container();
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<UnitCubit, UnitState>(
                          builder: (context, state) {
                            if (state is UnitLoaded) {
                              return CustomTextLato(
                                'Total units found: ${state.units.length}',
                                style: FontStyle.italic,
                                color: Colors.grey,
                              );
                            } else if (state is HighPriceLoaded) {
                              return CustomTextLato(
                                'Total units found: ${state.units.length}',
                                style: FontStyle.italic,
                                color: Colors.grey,
                              );
                            } else if (state is LowPriceLoaded) {
                              return CustomTextLato(
                                'Total units found: ${state.units.length}',
                                style: FontStyle.italic,
                                color: Colors.grey,
                              );
                            }
                            return Container();
                          },
                        ),
                        BlocBuilder<UnitCubit, UnitState>(
                          builder: (context, state) {
                            if (state is UnitLoading) {
                              return CustomLoading();
                            } else if (state is UnitLoaded) {
                              return UnitList(
                                units: state.units,
                              );
                            } else if (state is HighPriceLoaded) {
                              return UnitList(
                                units: state.units,
                              );
                            } else if (state is LowPriceLoaded) {
                              return UnitList(
                                units: state.units,
                              );
                            } else if (state is UnitError) {
                              return Center(
                                child: CustomTextLato(
                                  state.message,
                                  color: Colors.red,
                                ),
                              );
                            }
                            return Container();
                          },
                        ),
                      ],
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
