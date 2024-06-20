import '../../domain/entities/unit.dart';

import 'package:flutter/material.dart';

import 'components/_components.dart';

class UnitDetails extends StatelessWidget {
  const UnitDetails({
    Key key,
    @required this.unit,
  }) : super(key: key);
  final UnitEntity unit;
  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextLato(
            'UNIT DETAILS',
            size: 16,
            weight: FontWeight.bold,
          ),
          SizedBox(
            height: 25,
          ),
          Table(border: TableBorder.all(color: Colors.grey), children: [
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextLato(
                  'Project Name',
                  weight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextLato(
                  unit.projectId,
                  weight: FontWeight.bold,
                ),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextLato(
                  'Unit Name',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextLato(unit.buildingDesc),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextLato('Unit Code'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextLato(unit.unit),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextLato('Unit Type'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextLato(unit.unitType),
              ),
            ]),
            TableRow(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextLato('Floor Area'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextLato(unit.unitArea.toString() + ' sqm'),
              ),
            ]),
          ]),
        ],
      ),
    );
  }
}
