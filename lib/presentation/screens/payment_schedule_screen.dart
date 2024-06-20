import 'package:century_mobile/presentation/cubit/payment_schedule/payment_schedule_cubit.dart';
import 'package:century_mobile/presentation/cubit/pdf_link/pdflink_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constant/color.dart';
import '../../domain/entities/unit.dart';
import '../widgets/_widgets.dart';
import '../widgets/components/_components.dart';
import '../widgets/unit_details.dart';
import '_screens.dart';

class PaymentScheduleScreen extends StatefulWidget {
  const PaymentScheduleScreen({
    Key key,
    @required this.unit,
    this.termId,
    this.forex,
    this.parkingName,
    this.dateReserve,
    this.isForeign,
    this.storage,
    this.project,
    this.projectID,
    this.ffCode,
    this.unitPriceWithVat,
    this.totalPrice,
    this.totalFfPrice,
    this.parkingID,
  }) : super(key: key);
  final UnitEntity unit;
  final int termId;
  final String forex;
  final String parkingName;
  final DateTime dateReserve;
  final bool isForeign;
  final String storage;
  final String project;
  final String ffCode;
  final double unitPriceWithVat;
  final double totalPrice;
  final double totalFfPrice;
  final int parkingID;
  final String projectID;

  @override
  _PaymentScheduleScreenState createState() => _PaymentScheduleScreenState();
}

class _PaymentScheduleScreenState extends State<PaymentScheduleScreen> {
  String _userName = 'demo';

  @override
  void initState() {
    /*BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        print(state);
        if (state is Authenticated) {
          _userName = state.user.username;
          return;
        }
        else{
          print(state);
        }
        return;
      },
    );*/
    print(_userName);
    print('USERNAME');
    super.initState();
    context.read<PaymentScheduleCubit>().loadInitialData(
          baseURL: widget.unit.apiScheduleBaseURL,
          projectID: widget.unit.building, //widget.unit.projectId,
          unitID: widget.unit.unit.replaceAll(widget.unit.building, ''),
          forex: widget.forex,
          termId: widget.termId,
          parkingName: widget.parkingName,
          dateReserve: widget.dateReserve,
          isForeign: widget.isForeign,
          storage: widget.storage,
          project: widget.project,
          ffCode: widget.ffCode,
          unitPriceWithVAT: widget.unitPriceWithVat,
          totalPrice: widget.totalPrice,
          totalFfPrice: widget.totalFfPrice,
          parkingID: widget.parkingID,
          userName: _userName,
        );
    context.read<PdflinkCubit>().loadInitialData(
          baseURL: widget.unit.apiScheduleBaseURL,
          projectID: widget.unit.building, //widget.unit.projectId,
          unitID: widget.unit.unit.replaceAll(widget.unit.building, ''),
          forex: widget.forex,
          termId: widget.termId,
          parkingName: widget.parkingName,
          dateReserve: widget.dateReserve,
          isForeign: widget.isForeign,
          storage: widget.storage,
          project: widget.project,
          ffCode: widget.ffCode,
          unitPriceWithVAT: widget.unitPriceWithVat,
          totalPrice: widget.totalPrice,
          totalFfPrice: widget.totalFfPrice,
          parkingID: widget.parkingID,
          userName: _userName,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  UnitDetails(
                    unit: widget.unit,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextLato(
                          'PAYMENT SCHEDULE',
                          weight: FontWeight.bold,
                          size: 10.0.sp,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                        minWidth: constraints.minWidth),
                                    child: BlocBuilder<PaymentScheduleCubit,
                                        PaymentScheduleState>(
                                      builder: (context, state) {
                                        if (state is PaymentScheduleLoaded) {
                                          return DataTable(
                                              headingTextStyle:
                                                  GoogleFonts.lato(
                                                      fontSize: 9.0.sp),
                                              dataTextStyle: GoogleFonts.lato(
                                                  fontSize: 8.0.sp),
                                              dataRowHeight: 8.0.h,
                                              columnSpacing:
                                                  constraints.maxWidth >= 400
                                                      ? 5.0.h
                                                      : 1.0.h,
                                              columns: [
                                                DataColumn(
                                                  label: CustomTextLato(
                                                    '#',
                                                    weight: FontWeight.bold,
                                                  ),
                                                  numeric: true,
                                                ),
                                                DataColumn(
                                                  label: CustomTextLato(
                                                    'Date',
                                                    weight: FontWeight.bold,
                                                  ),
                                                  numeric: true,
                                                ),
                                                DataColumn(
                                                  label: CustomTextLato(
                                                    'Description',
                                                    weight: FontWeight.bold,
                                                  ),
                                                  numeric: true,
                                                ),
                                                DataColumn(
                                                  label: CustomTextLato(
                                                    'Total Payment',
                                                    weight: FontWeight.bold,
                                                  ),
                                                  numeric: true,
                                                )
                                              ],
                                              rows: [
                                                for (var i = 0;
                                                    i <
                                                        state.paymentSchedules
                                                            .length;
                                                    i++)
                                                  DataRow(
                                                    cells: [
                                                      DataCell(
                                                        CustomTextLato('$i'),
                                                      ),
                                                      DataCell(
                                                        CustomTextLato(
                                                            '${state.paymentSchedules[i].scheduleDate}'),
                                                      ),
                                                      DataCell(
                                                        CustomTextLato(
                                                            '${state.paymentSchedules[i].description}'),
                                                      ),
                                                      DataCell(
                                                        CustomTextLato(
                                                            '${state.paymentSchedules[i].totalAmount}'),
                                                      ),
                                                    ],
                                                  ),
                                              ]);
                                        }
                                        return CustomLoading();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        // SizedBox(
                        //   height: 25,
                        // ),
                        // CustomTextLato(
                        //   'NOTES:',
                        //   size: 10.0.sp,
                        //   weight: FontWeight.bold,
                        // ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: noteList
                        //       .map(
                        //         (item) => Column(
                        //           children: [
                        //             CustomTextLato(
                        //               item.id.toString() + '. ' + item.note,
                        //               size: 8.0.sp,
                        //               spacing: 1.7,
                        //               color: Colors.grey,
                        //             ),
                        //             SizedBox(
                        //               height: 10,
                        //             )
                        //           ],
                        //         ),
                        //       )
                        //       .toList(),
                        // ),
                        SizedBox(
                          height: 25,
                        ),
                        BlocBuilder<PdflinkCubit, PdflinkState>(
                          builder: (context, state) {
                            if (state is PdflinkLoaded) {
                              return CustomButtonText(
                                'DOWNLOAD PAYMENT SCHEDULE',
                                onTap: () async {
                                  if (await canLaunch(state.link)) {
                                    await launch(state.link);
                                  } else {
                                    throw 'Could not launch $state.link';
                                  }
                                },
                                color: CPColors.green,
                              );
                            }
                            return SizedBox();
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomButtonText(
                          'PAY NOW',
                          onTap: () => pushNewScreen(
                            context,
                            screen: OnlinePaymentScreen(unit: widget.unit),
                            withNavBar:
                                true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.fade,
                          ),
                          color: CPColors.green,
                        ),
                      ],
                    ),
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
                  ),
                ],
              ),
            ),
          ),
          CustomButtonBack(),
        ],
      ),
    );
  }
}
