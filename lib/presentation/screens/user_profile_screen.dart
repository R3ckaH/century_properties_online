import '../../core/constant/color.dart';
import '../widgets/components/custom_text_lato.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              backgroundColor: CPColors.green,
              radius: 84,
              child: CircleAvatar(
                backgroundColor: CPColors.green,
                radius: 83,
                backgroundImage: AssetImage(
                  'images/user_icon.png',
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextLato(
                  'KARL JAN S. REGINALDO',
                  size: 10.0.sp,
                ),
                CustomTextLato(
                  'Profile Name',
                  size: 8.0.sp,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextLato(
                  'reginaldokarl@gmail.com',
                  size: 10.0.sp,
                ),
                CustomTextLato(
                  'Email',
                  size: 8.0.sp,
                  color: Colors.grey,
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTextLato(
                  '09062452987',
                  size: 10.0.sp,
                ),
                CustomTextLato(
                  'Mobile Number',
                  size: 8.0.sp,
                  color: Colors.grey,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
