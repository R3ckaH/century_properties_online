import 'package:century_mobile/presentation/cubit/payment_upload/payment_upload_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../dependency_injector.dart';
import '../../domain/entities/unit.dart';
import '_screens.dart';
import '../widgets/components/_components.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../core/constant/color.dart';

class OnlinePaymentScreen extends StatelessWidget {
  final UnitEntity unit;
  const OnlinePaymentScreen({
    Key key,
    this.unit,
  }) : super(key: key);
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
                  // UnitDetails(
                  //   unit: unit,
                  // ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
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
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextLato(
                          'PAY RESERVATION FEE',
                          size: 10.0.sp,
                          weight: FontWeight.bold,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                const url =
                                    'https://customerportal.centurypropertiesonline.com/API_Unionbank.aspx?accessToken=dFYjkLnT36J77wqpJrI&uid=QUN0410&ccode=3000';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child:
                                    Image.asset('images/ubbank.png', scale: 5),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              alignment: Alignment.center,
                              child:
                                  Image.asset('images/master.png', scale: 10),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            GestureDetector(
                              onTap: () async {
                                const url =
                                    'https://pay.aqwire.io/centuryproperties';
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'images/qwik.png',
                                  scale: 7,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 75,
                        ),
                        CustomButtonText(
                          'CASH / REMITTANCE',
                          onTap: () => pushNewScreen(
                            context,
                            screen: BlocProvider(
                              create: (context) => sl<PaymentUploadCubit>(),
                              child: PaymentInfoScreen(
                                unit: unit,
                              ),
                            ),
                            withNavBar:
                                true, // OPTIONAL VALUE. True by default.
                            pageTransitionAnimation:
                                PageTransitionAnimation.fade,
                          ),
                          color: CPColors.green,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CustomButtonText(
                    'Cancel',
                    onTap: () => Navigator.pop(context),
                  )
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
