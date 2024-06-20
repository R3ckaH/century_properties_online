import 'package:century_mobile/domain/entities/payment_schedule.dart';
import 'package:century_mobile/domain/usecases/get_payment_schedules.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_schedule_state.dart';

class PaymentScheduleCubit extends Cubit<PaymentScheduleState> {
  PaymentScheduleCubit(this._getPaymentSchedules)
      : super(PaymentScheduleInitial());

  final GetPaymentSchedules _getPaymentSchedules;

  void loadInitialData(
      {String baseURL,
      String projectID,
      String unitID,
      String forex,
      int termId,
      String parkingName,
      DateTime dateReserve,
      bool isForeign,
      String storage,
      String project,
      String ffCode,
      double unitPriceWithVAT,
      double totalPrice,
      double totalFfPrice,
      int parkingID,
      String userName}) async {
    emit(PaymentScheduleLoading());
    await Future.delayed(Duration(milliseconds: 120));
    final _eitherPaymentScheduleListOrFailure =
        await _getPaymentSchedules(GetPaymentScheduleParams(
      baseURL: baseURL,
      projectID: projectID,
      unitID: unitID,
      forex: forex,
      termId: termId,
      parkingName: parkingName,
      dateReserve: dateReserve,
      isForeign: isForeign,
      storage: storage,
      project: project,
      ffCode: ffCode,
      unitPriceWithVAT: unitPriceWithVAT,
      totalPrice: totalPrice,
      totalFfPrice: totalFfPrice,
      parkingID: parkingID,
      userName: userName,
    ));

    _eitherPaymentScheduleListOrFailure.fold(
      (error) => emit(PaymentScheduleError(error.toString())),
      (projects) => emit(PaymentScheduleLoaded(projects)),
    );
  }
}
