import 'package:century_mobile/core/utils/converter.dart';
import 'package:century_mobile/domain/entities/fproject.dart';
import 'package:century_mobile/presentation/widgets/components/_components.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UnitContainer extends StatelessWidget {
  const UnitContainer({
    Key key,
    this.item,
  }) : super(key: key);
  final ProjectUnit item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.0.h,
      width: double.infinity,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 2,
              offset: Offset(-1, 3))
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                child: Image.asset(
                  item.imgSrc,
                  height: constraints.maxHeight,
                  width: 17.0.h,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextLato(
                      item.title,
                      size: 9.0.sp,
                      weight: FontWeight.bold,
                    ),
                    CustomTextLato(
                      item.unitCode,
                      size: 8.0.sp,
                    ),
                    CustomTextLato(
                      item.unitType,
                      size: 8.0.sp,
                    ),
                    CustomTextLato(
                      item.floorArea + ' sqm',
                      size: 8.0.sp,
                    ),
                    CustomTextLato(
                      'Php ${pesosConvert(item.price)}',
                      size: 9.0.sp,
                      weight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
