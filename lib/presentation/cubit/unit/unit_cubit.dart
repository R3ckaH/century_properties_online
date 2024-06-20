import 'package:bloc/bloc.dart';
import 'package:century_mobile/domain/usecases/get_buildings_item.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/unit.dart';
import '../../../domain/usecases/get_units.dart';

part 'unit_state.dart';

class UnitCubit extends Cubit<UnitState> {
  UnitCubit(this._getUnits, this._getItems) : super(UnitInitial());

  final GetUnits _getUnits;
  final GetBuildingsItem _getItems;
  void loadBuildingsItem(String building) async {
    emit(UnitLoading());
    await Future.delayed(Duration(milliseconds: 120));
    final _eitherUnitListOrFailure =
        await _getItems(GetBuildingsItemParams(building));

    _eitherUnitListOrFailure.fold((error) {
      emit(UnitError(error.toString()));
    }, (units) {
      emit(UnitLoaded(units));
    });
  }

  void loadUnits(
      {@required String id,
      String unitType,
      String floor,
      List<UnitEntity> unitState}) async {
    emit(UnitLoading());
    await Future.delayed(Duration(milliseconds: 120));
    print(unitType);
    print(floor);
    if (unitType.isEmpty && floor.isEmpty) {
      print('All');
      emit(
        UnitLoaded(unitState),
      );
    } else {
      print('Not All');

      List<UnitEntity> filteredUnitsByUnitType =
          unitState.where((unit) => unit.unitType.contains(unitType)).toList();

      if (floor.isEmpty) {
        emit(
          UnitLoaded(filteredUnitsByUnitType),
        );
      } else {
        List<UnitEntity> filteredUnitsByFloor =
            unitState.where((unit) => unit.floor.contains(floor)).toList();
        emit(UnitLoaded(filteredUnitsByFloor));
      }
    }
  }

  void filterByHighPrice(List<UnitEntity> units) async {
    emit(UnitLoading());
    await Future.delayed(Duration(milliseconds: 120));
    units.sort((a, b) => -a.unitPrice.compareTo(b.unitPrice));
    emit(
      HighPriceLoaded(units),
    );
  }

  void filterByLowPrice(List<UnitEntity> units) async {
    emit(UnitLoading());
    await Future.delayed(Duration(milliseconds: 120));

    units.sort((a, b) => a.unitPrice.compareTo(b.unitPrice));
    emit(
      LowPriceLoaded(units),
    );
  }

  Future<List<UnitEntity>> loadNext(int offset,
      {List<UnitEntity> units}) async {
    List<UnitEntity> nextUsersList;
    try {
      nextUsersList = units.sublist(offset, 15 + offset);
    } catch (e) {
      nextUsersList = units.sublist(offset, units.length);
    }

    await Future.delayed(Duration(seconds: 2));
    return nextUsersList;
  }

  void dispose() => emit(UnitInitial());
}
