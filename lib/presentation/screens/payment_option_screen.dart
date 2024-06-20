import 'package:century_mobile/core/constant/color.dart';
import 'package:century_mobile/dependency_injector.dart';
import 'package:century_mobile/presentation/cubit/authentication/authentication_cubit.dart';
import 'package:century_mobile/presentation/cubit/parking_building/parking_building_cubit.dart';
import 'package:century_mobile/presentation/cubit/parking_level/parking_level_cubit.dart';
import 'package:century_mobile/presentation/cubit/parking_slot/parking_slot_cubit.dart';
import 'package:century_mobile/presentation/cubit/payment_option/payment_option_cubit.dart';
import 'package:century_mobile/presentation/cubit/payment_schedule/payment_schedule_cubit.dart';
import 'package:century_mobile/presentation/cubit/pdf_link/pdflink_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sizer/sizer.dart';

import '../../domain/entities/unit.dart';
import '../widgets/_widgets.dart';
import '../widgets/components/_components.dart';
import '_screens.dart';

class PaymentOptionScreen extends StatefulWidget {
  const PaymentOptionScreen({
    Key key,
    @required this.unit,
  }) : super(key: key);
  final UnitEntity unit;

  @override
  _PaymentOptionScreenState createState() => _PaymentOptionScreenState();
}

class _PaymentOptionScreenState extends State<PaymentOptionScreen> {
  String _parkingBuildingValue;
  String _parkingLevelValue;
  String _parkingSlotValue;
  bool _isForeignBuyer = false;
  String _ffCode;
  String _forex = "PHP";
  ScrollController scroller;
  List<String> currencies = [
    "PHP",
    "USD",
  ];

  TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    scroller = ScrollController();
    context
        .read<ParkingBuildingCubit>()
        .loadInitialData(projectID: widget.unit.projectId);
    context
        .read<ParkingLevelCubit>()
        .loadInitialData(building: _parkingBuildingValue);
    context.read<ParkingSlotCubit>().loadInitialData();
    context.read<PaymentOptionCubit>().loadInitialData(
          baseURL: widget.unit.apiTermsBaseURL ?? '',
          projectID: widget.unit.building ?? '',
          unitID: widget.unit.unit.replaceAll(widget.unit.building, '') ?? '',
          isForeign: _isForeignBuyer,
          ffCode: _ffCode ?? '',
          ch: '0',
          tag: '',
          parkingID: _parkingSlotValue ?? '',
        );
  }

  @override
  void dispose() {
    context.read<ParkingBuildingCubit>().close();
    context.read<ParkingLevelCubit>().close();
    context.read<ParkingSlotCubit>().close();
    context.read<PaymentOptionCubit>().close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              controller: scroller,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    //CustomButtonBack(),
                    UnitDetails(unit: widget.unit),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: CustomTextLato(
                                  'PARKING TOWER',
                                  size: 12,
                                ),
                                width: 100,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: BlocBuilder<ParkingBuildingCubit,
                                    ParkingBuildingState>(
                                  builder: (context, state) {
                                    return (state is ParkingBuildingLoaded)
                                        ? DropdownButton(
                                            style: TextStyle(),
                                            hint: CustomTextLato(
                                              'Select Parking Tower',
                                              size: 12,
                                            ),
                                            value: _parkingBuildingValue,
                                            onChanged: (value) {
                                              context
                                                  .read<PaymentOptionCubit>()
                                                  .dispose();
                                              setState(() {
                                                /*unitTypeList = [];
                                                _unitValue = null;
                                                _floorValue = null;*/

                                                _parkingLevelValue = null;
                                                _parkingSlotValue = null;
                                                _parkingBuildingValue = value;
                                              });
                                              context
                                                  .read<PaymentOptionCubit>()
                                                  .loadInitialData(
                                                    baseURL: widget.unit
                                                            .apiTermsBaseURL ??
                                                        '',
                                                    projectID:
                                                        widget.unit.building ??
                                                            '',
                                                    unitID: widget.unit.unit
                                                            .replaceAll(
                                                                widget.unit
                                                                    .building,
                                                                '') ??
                                                        '',
                                                    isForeign: _isForeignBuyer,
                                                    ffCode: _ffCode ?? '',
                                                    ch: '0',
                                                    tag: '',
                                                    parkingID:
                                                        _parkingSlotValue ?? '',
                                                  );
                                              if (_parkingBuildingValue
                                                  .isNotEmpty)
                                                context
                                                    .read<ParkingLevelCubit>()
                                                    .loadInitialData(
                                                      building:
                                                          _parkingBuildingValue,
                                                    );
                                            },
                                            underline: SizedBox(),
                                            isExpanded: true,
                                            items: state.parkingBuildings
                                                .toSet()
                                                .map(
                                                  (parkingBuilding) =>
                                                      DropdownMenuItem(
                                                    child: CustomTextLato(
                                                      '${parkingBuilding.buildingName}',
                                                      size: 12,
                                                    ),
                                                    value: parkingBuilding
                                                        .building,
                                                  ),
                                                )
                                                .toList())
                                        : DropdownButton(
                                            hint: CustomTextLato(
                                              'Select Parking Tower',
                                              size: 12,
                                            ),
                                            underline: SizedBox(),
                                            isExpanded: true,
                                            items: []);
                                  },
                                ),
                                flex: 1,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: CustomTextLato(
                                  'PARKING LEVEL',
                                  size: 12,
                                ),
                                width: 100,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: BlocBuilder<ParkingLevelCubit,
                                    ParkingLevelState>(
                                  builder: (context, state) {
                                    return (state is ParkingLevelLoaded)
                                        ? DropdownButton(
                                            hint: CustomTextLato(
                                              'Select Parking Level',
                                              size: 12,
                                            ),
                                            value: _parkingLevelValue,
                                            onChanged: (value) {
                                              context
                                                  .read<PaymentOptionCubit>()
                                                  .dispose();
                                              setState(() {
                                                /*unitTypeList = [];
                                                _unitValue = null;
                                                _floorValue = null;*/
                                                _parkingSlotValue = null;
                                                _parkingLevelValue = value;
                                              });
                                              context
                                                  .read<PaymentOptionCubit>()
                                                  .loadInitialData(
                                                    baseURL: widget.unit
                                                            .apiTermsBaseURL ??
                                                        '',
                                                    projectID:
                                                        widget.unit.building ??
                                                            '',
                                                    unitID: widget.unit.unit
                                                            .replaceAll(
                                                                widget.unit
                                                                    .building,
                                                                '') ??
                                                        '',
                                                    isForeign: _isForeignBuyer,
                                                    ffCode: _ffCode ?? '',
                                                    ch: '0',
                                                    tag: '',
                                                    parkingID:
                                                        _parkingSlotValue ?? '',
                                                  );
                                              if (_parkingLevelValue.isNotEmpty)
                                                context
                                                    .read<ParkingSlotCubit>()
                                                    .loadInitialData(
                                                        building:
                                                            _parkingBuildingValue,
                                                        floorName:
                                                            _parkingLevelValue);
                                            },
                                            underline: SizedBox(),
                                            isExpanded: true,
                                            items: state.parkingLevels
                                                .toSet()
                                                .map(
                                                  (parkingLevel) =>
                                                      DropdownMenuItem(
                                                    child: CustomTextLato(
                                                      '${parkingLevel.floorName}',
                                                      size: 12,
                                                    ),
                                                    value:
                                                        parkingLevel.floorName,
                                                  ),
                                                )
                                                .toList())
                                        : DropdownButton(
                                            hint: CustomTextLato(
                                              'Select Parking Level',
                                              size: 12,
                                            ),
                                            underline: SizedBox(),
                                            isExpanded: true,
                                            items: []);
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                child: CustomTextLato(
                                  'PARKING SLOT',
                                  size: 12,
                                ),
                                width: 100,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: BlocBuilder<ParkingSlotCubit,
                                    ParkingSlotState>(
                                  builder: (context, state) {
                                    return (state is ParkingSlotLoaded)
                                        ? DropdownButton(
                                            hint: CustomTextLato(
                                              'Select Parking Slot',
                                              size: 12,
                                            ),
                                            value: _parkingSlotValue,
                                            onChanged: (value) {
                                              context
                                                  .read<PaymentOptionCubit>()
                                                  .dispose();
                                              setState(() {
                                                _parkingSlotValue = value;
                                              });
                                              context
                                                  .read<PaymentOptionCubit>()
                                                  .loadInitialData(
                                                    baseURL: widget.unit
                                                            .apiTermsBaseURL ??
                                                        '',
                                                    projectID:
                                                        widget.unit.building ??
                                                            '',
                                                    unitID: widget.unit.unit
                                                            .replaceAll(
                                                                widget.unit
                                                                    .building,
                                                                '') ??
                                                        '',
                                                    isForeign: _isForeignBuyer,
                                                    ffCode: _ffCode ?? '',
                                                    ch: '0',
                                                    tag: '',
                                                    parkingID:
                                                        _parkingSlotValue ?? '',
                                                  );
                                            },
                                            underline: SizedBox(),
                                            isExpanded: true,
                                            items: state.parkingSlots
                                                .toSet()
                                                .map(
                                                  (parkingSlot) =>
                                                      DropdownMenuItem(
                                                    child: CustomTextLato(
                                                        '${parkingSlot.slotName}'),
                                                    value: parkingSlot.slotId
                                                        .toString(),
                                                  ),
                                                )
                                                .toList())
                                        : DropdownButton(
                                            hint: CustomTextLato(
                                              'Select Parking Slot',
                                              size: 12,
                                            ),
                                            underline: SizedBox(),
                                            isExpanded: true,
                                            items: []);
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: CustomTextLato(
                                  'Foreign Buyer',
                                  size: 12,
                                ),
                                width: 100,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Checkbox(
                                    value: _isForeignBuyer,
                                    onChanged: (bool value) {
                                      context
                                          .read<PaymentOptionCubit>()
                                          .dispose();
                                      setState(() {
                                        _isForeignBuyer = value;
                                      });
                                      context
                                          .read<PaymentOptionCubit>()
                                          .loadInitialData(
                                            baseURL:
                                                widget.unit.apiTermsBaseURL ??
                                                    '',
                                            projectID:
                                                widget.unit.building ?? '',
                                            unitID: widget.unit.unit.replaceAll(
                                                    widget.unit.building, '') ??
                                                '',
                                            isForeign: _isForeignBuyer,
                                            ffCode: _ffCode ?? '',
                                            ch: '0',
                                            tag: '',
                                            parkingID: _parkingSlotValue ?? '',
                                          );
                                    }),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: CustomTextLato(
                                  'F&F Code',
                                  size: 12,
                                ),
                                width: 100,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _controller,
                                  onChanged: (value) {
                                    context
                                        .read<PaymentOptionCubit>()
                                        .dispose();
                                    setState(() {
                                      _ffCode = value;
                                    });
                                    context
                                        .read<PaymentOptionCubit>()
                                        .loadInitialData(
                                          baseURL:
                                              widget.unit.apiTermsBaseURL ?? '',
                                          projectID: widget.unit.building ?? '',
                                          unitID: widget.unit.unit.replaceAll(
                                                  widget.unit.building, '') ??
                                              '',
                                          isForeign: _isForeignBuyer,
                                          ffCode: _ffCode ?? '',
                                          ch: '0',
                                          tag: '',
                                          parkingID: _parkingSlotValue ?? '',
                                        );
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Enter code',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: CustomTextLato(
                                  'Forex',
                                  size: 12,
                                ),
                                width: 100,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                padding: EdgeInsets.all(20.0),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    hint: Text("Select Currency"),
                                    value: _forex,
                                    isDense: true,
                                    onChanged: (newValue) {
                                      context
                                          .read<PaymentOptionCubit>()
                                          .dispose();
                                      setState(() {
                                        _forex = newValue;
                                      });
                                      print(_forex);
                                      context
                                          .read<PaymentOptionCubit>()
                                          .loadInitialData(
                                            baseURL:
                                                widget.unit.apiTermsBaseURL ??
                                                    '',
                                            projectID:
                                                widget.unit.building ?? '',
                                            unitID: widget.unit.unit.replaceAll(
                                                    widget.unit.building, '') ??
                                                '',
                                            isForeign: _isForeignBuyer,
                                            ffCode: _ffCode ?? '',
                                            ch: '0',
                                            tag: '',
                                            parkingID: _parkingSlotValue ?? '',
                                          );
                                    },
                                    items: currencies.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    BlocBuilder<PaymentOptionCubit, PaymentOptionState>(
                        builder: (context, state) {
                      if (state is PaymentOptionLoaded) {
                        return Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextLato(
                                'PAYMENT OPTIONS',
                                size: 10.0.sp,
                                weight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Table(
                                  border: TableBorder.all(color: Colors.grey),
                                  children: state.paymentOptions
                                      .map(
                                        (paymentOption) => _paymentItem(
                                            text: paymentOption.termDescription,
                                            /*onTap: () => pushNewScreen(
                                                    context,
                                                    screen: PaymentScheduleScreen(
                                                      unit: widget.unit,
                                                    ),
                                                    withNavBar:
                                                    true, // OPTIONAL VALUE. True by default.
                                                    pageTransitionAnimation:
                                                    PageTransitionAnimation.fade,
                                                  ),*/
                                            onTap: () {
                                              pushDynamicScreen(
                                                context,
                                                screen: MaterialPageRoute(
                                                    builder: (_) =>
                                                        MultiBlocProvider(
                                                          providers: [
                                                            BlocProvider.value(
                                                              value: sl<
                                                                  PaymentScheduleCubit>()
                                                                ..loadInitialData(),
                                                            ),
                                                            BlocProvider.value(
                                                              value: sl<
                                                                  AuthenticationCubit>()
                                                                ..logsCheck(),
                                                            ),
                                                            BlocProvider.value(
                                                                value: sl<
                                                                    PdflinkCubit>()),
                                                          ],
                                                          child:
                                                              PaymentScheduleScreen(
                                                            unit: widget.unit,
                                                            termId:
                                                                paymentOption
                                                                    .termId,
                                                            forex: _forex,
                                                            parkingName: '0',
                                                            dateReserve:
                                                                DateTime.now(),
                                                            isForeign:
                                                                _isForeignBuyer,
                                                            storage: '0',
                                                            project: widget
                                                                .unit.projectId,
                                                            projectID: widget
                                                                .unit.building,
                                                            ffCode: _ffCode,
                                                            unitPriceWithVat:
                                                                paymentOption
                                                                    .unitPriceWithVAT,
                                                            totalPrice:
                                                                paymentOption
                                                                    .totalPriceWithVAT,
                                                            totalFfPrice: 0,
                                                            parkingID: 0,
                                                          ),
                                                        )),
                                                withNavBar: true,
                                              );
                                            }),
                                      )
                                      .toList()),
                            ],
                          ),
                        );
                      }

                      return Container();
                    }),
                  ],
                ),
              ),
            ),
            CustomButtonBack(),
          ],
        ),
      ),
    );
  }

  TableRow _paymentItem({@required String text, Function onTap}) {
    return TableRow(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomTextLato(
                  text,
                  weight: FontWeight.bold,
                ),
                IconButton(
                  icon: Icon(Icons.arrow_right),
                  onPressed: onTap,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
