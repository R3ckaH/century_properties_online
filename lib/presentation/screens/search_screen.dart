import 'dart:math';

import 'package:century_mobile/presentation/cubit/building/building_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sizer/sizer.dart';

import '../../core/constant/color.dart';
import '../../domain/entities/unit.dart';
import '../cubit/project/project_cubit.dart';
import '../cubit/unit/unit_cubit.dart';
import '../widgets/_widgets.dart';
import '../widgets/components/_components.dart';
import '../widgets/components/custom_text_lato.dart';

class SearchScreen extends StatefulWidget {
  final PersistentTabController persistentTabController;
  SearchScreen({Key key, this.persistentTabController}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isSearhing;
  String _projValue;
  String _buildingValue;
  String _unitTypeValue;
  String _floorValue;
  List<UnitEntity> unitTypeList = [];
  @override
  void initState() {
    super.initState();
    isSearhing = true;
    context.read<ProjectCubit>().loadInitialData();
  }

  @override
  void dispose() {
    context.read<ProjectCubit>().close();
    context.read<UnitCubit>().close();
    context.read<BuildingCubit>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: CustomTextLato(
          'SEARCH',
        ),
        actions: [
          AnimatedContainer(
            curve: Curves.easeOutQuad,
            duration: Duration(milliseconds: 200),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    isSearhing = !isSearhing;
                    context.read<ProjectCubit>().loadInitialData();
                    context.read<BuildingCubit>().dispose();
                    context.read<UnitCubit>().dispose();
                    _projValue = null;
                    _buildingValue = null;
                    _unitTypeValue = null;
                    _floorValue = null;
                    unitTypeList = [];
                  });
                },
                icon: isSearhing
                    ? Transform.rotate(
                        angle: -pi / 4,
                        child: Icon(
                          Icons.add_outlined,
                          color: Colors.black,
                        ),
                      )
                    : Icon(
                        Icons.search,
                        color: Colors.black,
                      )),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: isSearhing
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextLato('PROJECT NAME'),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: BlocBuilder<ProjectCubit, ProjectState>(
                          builder: (context, state) {
                            return (state is ProjectLoaded)
                                ? DropdownButton(
                                    hint: CustomTextLato('All Projects'),
                                    value: _projValue,
                                    onChanged: (value) {
                                      setState(() {
                                        _buildingValue = null;
                                        _unitTypeValue = null;
                                        _floorValue = null;
                                        _projValue = value;
                                      });
                                      print('Value:$_projValue');
                                      if (_projValue != null ||
                                          _projValue.isNotEmpty)
                                        context
                                            .read<BuildingCubit>()
                                            .getBuildings(_projValue);
                                    },
                                    underline: SizedBox(),
                                    isExpanded: true,
                                    items: state.projects
                                        .toSet()
                                        .map(
                                          (project) => DropdownMenuItem(
                                            child: CustomTextLato(
                                                '${project.projectName}'),
                                            value: project.projectId,
                                          ),
                                        )
                                        .toList())
                                : DropdownButton(
                                    hint: CustomTextLato('All Projects'),
                                    underline: SizedBox(),
                                    isExpanded: true,
                                    items: []);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      CustomTextLato('BUILDINGS'),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: BlocBuilder<BuildingCubit, BuildingState>(
                          builder: (context, state) {
                            return (state is BuildingLoaded)
                                ? DropdownButton(
                                    hint: CustomTextLato('All Buildings'),
                                    value: _buildingValue,
                                    onChanged: (value) {
                                      _floorValue = null;

                                      setState(() {
                                        _buildingValue = value;
                                      });

                                      if (_buildingValue != null ||
                                          _buildingValue.isNotEmpty)
                                        context
                                            .read<UnitCubit>()
                                            .loadBuildingsItem(_buildingValue);
                                    },
                                    underline: SizedBox(),
                                    isExpanded: true,
                                    items: state.buildings
                                        .toSet()
                                        .map(
                                          (building) => DropdownMenuItem(
                                            child: CustomTextLato(
                                                building.buildingName ?? ''),
                                            value: building.building ?? '',
                                          ),
                                        )
                                        .toList())
                                : DropdownButton(
                                    hint: CustomTextLato('All Buildings'),
                                    underline: SizedBox(),
                                    isExpanded: true,
                                    items: []);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      CustomTextLato('UNIT TYPE'),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: BlocBuilder<UnitCubit, UnitState>(
                          builder: (context, state) {
                            if (state is UnitLoaded) {
                              unitTypeList = state.units;

                              print(unitTypeList);
                              List<UnitEntity> stateUnits =
                                  state.units.toSet().toList();

                              return DropdownButton(
                                  hint: CustomTextLato('All Unit Type'),
                                  value: _unitTypeValue,
                                  onChanged: (value) {
                                    String currentFloor = '';
                                    unitTypeList = [];

                                    state.units.sort(
                                        (a, b) => a.floor.compareTo(b.floor));

                                    for (var item in state.units) {
                                      if (item.floor != currentFloor) {
                                        unitTypeList.add(item);
                                      }
                                      currentFloor = item.floor;
                                    }
                                    setState(() {
                                      _unitTypeValue = value;
                                      _floorValue = null;
                                    });
                                  },
                                  underline: SizedBox(),
                                  isExpanded: true,
                                  items: stateUnits
                                      .map(
                                        (unit) => DropdownMenuItem(
                                          child: CustomTextLato(
                                              unit.unitType ?? ''),
                                          value: unit.unitType ?? '',
                                        ),
                                      )
                                      .toList());
                            }

                            return DropdownButton(
                                hint: CustomTextLato('All Unit Type'),
                                underline: SizedBox(),
                                isExpanded: true,
                                items: []);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      CustomTextLato('FLOOR / BLOCK'),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton(
                            hint: CustomTextLato('All Floor/Block'),
                            value: _floorValue,
                            onChanged: (value) {
                              setState(() {
                                _floorValue = value;
                              });
                            },
                            underline: SizedBox(),
                            isExpanded: true,
                            items: unitTypeList
                                .map(
                                  (unit) => DropdownMenuItem(
                                    child: CustomTextLato(unit.floor ?? ''),
                                    value: unit.floor,
                                  ),
                                )
                                .toList()),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      BlocBuilder<UnitCubit, UnitState>(
                        builder: (context, state) {
                          if (state is UnitLoaded) {
                            return CustomButtonText(
                              'SEARCH',
                              onTap: () {
                                print(unitTypeList);
                                context.read<UnitCubit>().loadUnits(
                                    id: _projValue ?? 'All',
                                    unitType: _unitTypeValue ?? '',
                                    floor: _floorValue ?? '',
                                    unitState: unitTypeList);

                                setState(() {});
                                isSearhing = !isSearhing;
                              },
                              width: double.infinity,
                              color: CPColors.darkGreen,
                            );
                          }
                          return CustomButtonText(
                            'SEARCH',
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: Colors.white,
                                      content: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          CustomTextLato(
                                              'Please select atleast Project and Building'),
                                          Icon(
                                            Icons.info,
                                            color: Colors.green,
                                          )
                                        ],
                                      )));
                            },
                            width: double.infinity,
                            color: CPColors.grey,
                          );
                        },
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: BlocBuilder<UnitCubit, UnitState>(
                    builder: (context, state) {
                      print(state);
                      if (state is UnitLoaded) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextLato(
                              'Total units found: ${state.units.length}',
                              style: FontStyle.italic,
                              color: Colors.grey,
                            ),
                            UnitList(
                              units: state.units,
                            ),
                          ],
                        );
                      }
                      return Center(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 40.0.h,
                            ),
                            CustomTextLato(
                              'Search Something',
                              weight: FontWeight.w600,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomTextLato(
                                'Search Projects,Unit Type and Floors/Blocks . . .'),
                          ],
                        ),
                      );
                    },
                  ),
                )),
    );
  }
}
