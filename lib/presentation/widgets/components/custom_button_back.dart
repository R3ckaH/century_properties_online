import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonBack extends StatelessWidget {
  final Function adsOnPressed;
  const CustomButtonBack({
    Key key,
    this.adsOnPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
          adsOnPressed();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: CPColors.green,
        ),
      ),
    );
  }
}
