import 'package:bloc/bloc.dart';
import '../../../domain/entities/inclusion.dart';
import '../../../domain/usecases/get_specs.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'inclusion_state.dart';

class InclusionCubit extends Cubit<InclusionState> {
  InclusionCubit(this._getSpecs) : super(InclusionInitial());

  final GetSpecs _getSpecs;

  void getSpecification({@required String unitID}) async {
    emit(InclusionLoading());

    final _eitherSpecsOrFailure = await _getSpecs(GetSpecsParams(unitID));

    _eitherSpecsOrFailure.fold(
      (fail) => emit(
        InclusionError(
          fail.toString(),
        ),
      ),
      (specs) => emit(
        specs.isNotEmpty
            ? InclusionLoaded(specs)
            : InclusionError('Not Available Yet'),
      ),
    );
  }
}
