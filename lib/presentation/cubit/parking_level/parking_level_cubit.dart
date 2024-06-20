import 'package:bloc/bloc.dart';
import 'package:century_mobile/domain/entities/parking_level.dart';
import 'package:century_mobile/domain/usecases/get_parking_levels.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'parking_level_state.dart';

class ParkingLevelCubit extends Cubit<ParkingLevelState> {
  ParkingLevelCubit(this._getParkingLevels) : super(ParkingLevelInitial());

  final GetParkingLevels _getParkingLevels;

  void loadInitialData({@required String building}) async {
    emit(ParkingLevelLoading());
    await Future.delayed(Duration(milliseconds: 120));
    final _eitherParkingBuildingListOrFailure =
        await _getParkingLevels(GetParkingLevelParams(building: building));

    _eitherParkingBuildingListOrFailure.fold(
      (error) => emit(ParkingLevelError(error.toString())),
      (projects) => emit(ParkingLevelLoaded(projects)),
    );
  }
}
