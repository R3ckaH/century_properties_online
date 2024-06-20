import 'package:bloc/bloc.dart';
import 'package:century_mobile/domain/entities/building.dart';
import 'package:century_mobile/domain/usecases/get_buildings.dart';
import 'package:equatable/equatable.dart';

part 'building_state.dart';

class BuildingCubit extends Cubit<BuildingState> {
  BuildingCubit(this._getBuildings) : super(BuildingInitial());

  final GetBuildings _getBuildings;

  void getBuildings(String projectId) async {
    emit(BuildingLoading());
    await Future.delayed(Duration(milliseconds: 120));
    final _eitherBuildingsOrFailure =
        await _getBuildings(GetBuildingsParams(projectId));

    _eitherBuildingsOrFailure.fold(
      (fail) => emit(
        BuildingError(
          fail.toString(),
        ),
      ),
      (buildings) => emit(
        buildings.isNotEmpty
            ? BuildingLoaded(buildings)
            : BuildingError('No Buildings'),
      ),
    );
  }

  void dispose() => emit(BuildingInitial());
}
