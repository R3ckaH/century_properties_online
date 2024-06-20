import '../../../domain/entities/unit.dart';
import '../../cubit/unit/unit_cubit.dart';
import '_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFilterButton extends StatefulWidget {
  const CustomFilterButton({
    Key key,
    @required this.units,
  }) : super(key: key);
  final List<UnitEntity> units;
  @override
  _CustomFilterButtonState createState() => _CustomFilterButtonState();
}

class _CustomFilterButtonState extends State<CustomFilterButton> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(),
        ),
        child: PopupMenuButton(
          tooltip: 'Filter Unit',
          onSelected: (id) {
            switch (id) {
              case 1:
                context.read<UnitCubit>().filterByLowPrice(widget.units);
                break;
              case 2:
                context.read<UnitCubit>().filterByHighPrice(widget.units);
                break;
            }
          },
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              child: CustomTextLato('Price Low to High'),
              value: 1,
            ),
            PopupMenuItem(
              child: CustomTextLato('Price High to Low'),
              value: 2,
            ),
          ],
          child: CustomTextLato(
            'Filter',
          ),
        ));
  }
}
