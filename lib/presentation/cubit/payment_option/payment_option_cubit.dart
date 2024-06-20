import 'package:century_mobile/domain/entities/payment_option.dart';
import 'package:century_mobile/domain/usecases/get_payment_options.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payment_option_state.dart';

class PaymentOptionCubit extends Cubit<PaymentOptionState> {
  PaymentOptionCubit(this._getPaymentOptions) : super(PaymentOptionInitial());

  final GetPaymentOptions _getPaymentOptions;

  void loadInitialData(
      {String baseURL,
      String projectID,
      String unitID,
      String tag,
      String ch,
      String ffCode,
      bool isForeign,
      String parkingID}) async {
    emit(PaymentOptionLoading());
    await Future.delayed(Duration(milliseconds: 120));
    final _eitherPaymentOptionListOrFailure = await _getPaymentOptions(
        GetPaymentOptionParams(
            baseURL: baseURL,
            projectID: projectID,
            unitID: unitID,
            tag: tag,
            ch: ch,
            ffCode: ffCode,
            isForeign: isForeign,
            parkingID: parkingID));

    _eitherPaymentOptionListOrFailure.fold(
      (error) => emit(PaymentOptionError(error.toString())),
      (projects) => emit(PaymentOptionLoaded(projects)),
    );
  }

  void dispose() async {
    await Future.delayed(Duration(milliseconds: 120));
    emit(PaymentOptionInitial());
  }
}
