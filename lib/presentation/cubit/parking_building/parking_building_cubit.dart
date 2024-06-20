import 'package:bloc/bloc.dart';
import 'package:century_mobile/domain/entities/parking_building.dart';
import 'package:century_mobile/domain/usecases/get_parking_buildings.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'parking_building_state.dart';

class ParkingBuildingCubit extends Cubit<ParkingBuildingState> {
  ParkingBuildingCubit(this._getParkingBuildings)
      : super(ParkingBuildingInitial());

  final GetParkingBuildings _getParkingBuildings;

  void loadInitialData({@required String projectID}) async {
    emit(ParkingBuildingLoading());
    await Future.delayed(Duration(milliseconds: 120));
    final _eitherParkingBuildingListOrFailure = await _getParkingBuildings(
        GetParkingBuildingParams(projectId: projectID));

    _eitherParkingBuildingListOrFailure.fold(
      (error) => emit(ParkingBuildingError(error.toString())),
      (projects) => emit(ParkingBuildingLoaded(projects)),
    );
  }
}
