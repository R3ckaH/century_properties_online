import 'package:century_mobile/domain/entities/parking_slot.dart';
import 'package:century_mobile/domain/usecases/get_parking_slots.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'parking_slot_state.dart';

class ParkingSlotCubit extends Cubit<ParkingSlotState> {
  ParkingSlotCubit(this._getParkingSlots) : super(ParkingSlotInitial());

  final GetParkingSlots _getParkingSlots;

  void loadInitialData({String building, String floorName}) async {
    emit(ParkingSlotLoading());
    await Future.delayed(Duration(milliseconds: 120));
    final _eitherParkingBuildingListOrFailure = await _getParkingSlots(
        GetParkingSlotParams(building: building, floorName: floorName));

    _eitherParkingBuildingListOrFailure.fold(
      (error) => emit(ParkingSlotError(error.toString())),
      (projects) => emit(ParkingSlotLoaded(projects)),
    );
  }
}
