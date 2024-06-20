import '../../core/utils/converter.dart';
import '../../domain/entities/unit.dart';
import 'components/_components.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UnitContainer extends StatelessWidget {
  const UnitContainer({
    Key key,
    this.item,
  }) : super(key: key);
  final UnitEntity item;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              child: Image.network(
                item.coverPhoto,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Image.asset(
                  'images/default_image.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
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
                    item.buildingDesc,
                    size: 10.0.sp,
                    weight: FontWeight.bold,
                  ),
                  CustomTextLato(
                    item.unit,
                    size: 8.0.sp,
                  ),
                  CustomTextLato(
                    item.unitType,
                    size: 8.0.sp,
                  ),
                  CustomTextLato(
                    item.unitArea.toString() + ' sqm',
                    size: 8.0.sp,
                  ),
                  CustomTextLato(
                    'Php ${pesosConvert(item.unitPrice)}',
                    size: 10.0.sp,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
