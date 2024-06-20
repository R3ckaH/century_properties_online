import '../../dependency_injector.dart';
import '../../domain/entities/unit.dart';
import '../cubit/inclusion/inclusion_cubit.dart';
import '../cubit/unit/unit_cubit.dart';
import '../screens/condo_unit_screen.dart';
import '_widgets.dart';
import 'components/_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class UnitList extends StatelessWidget {
  const UnitList({
    Key key,
    @required this.units,
  }) : super(key: key);

  final List<UnitEntity> units;

  @override
  Widget build(BuildContext context) {
    return PaginationView<UnitEntity>(
        shrinkWrap: true,
        paginationViewType: PaginationViewType.listView,
        itemBuilder: (BuildContext context, UnitEntity item, int index) =>
            GestureDetector(
              onTap: () => pushNewScreen(
                context,
                screen: BlocProvider.value(
                  value: sl<InclusionCubit>()
                    ..getSpecification(unitID: item.unit),
                  child: CondoUnitScreen(
                    unit: item,
                  ),
                ),
                withNavBar: false,
                // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.fade,
              ),
              child: UnitContainer(
                item: item,
              ),
            ),
        pageFetch: (offset) =>
            context.read<UnitCubit>().loadNext(offset, units: units),
        pullToRefresh: true,
        onError: (dynamic error) => Center(
              child: Text('Some error occured'),
            ),
        physics: BouncingScrollPhysics(),
        onEmpty: Center(
          child: Text('Sorry! This is empty'),
        ),
        initialLoader: CustomLoading(),
        bottomLoader: CustomLoading());
    // return Column(
    //   children: units
    //       .map(
    //         (item) => GestureDetector(
    //           onTap: () => pushNewScreen(
    //             context,
    //             screen: BlocProvider.value(
    //               value: sl<InclusionCubit>()
    //                 ..getSpecification(unitID: item.unit),
    //               child: CondoUnitScreen(
    //                 unit: item,
    //               ),
    //             ),
    //             withNavBar: false,
    //             // OPTIONAL VALUE. True by default.
    //             pageTransitionAnimation: PageTransitionAnimation.fade,
    //           ),
    //           child: UnitContainer(
    //             item: item,
    //           ),
    //         ),
    //       )
    //       .toList(),
    // );
  }
}
