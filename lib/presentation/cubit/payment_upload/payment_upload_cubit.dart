import 'package:bloc/bloc.dart';
import 'package:century_mobile/domain/usecases/upload_payment_info.dart';
import 'package:equatable/equatable.dart';

part 'payment_upload_state.dart';

class PaymentUploadCubit extends Cubit<PaymentUploadState> {
  PaymentUploadCubit(this._paymentInfo) : super(PaymentUploadInitial());

  final UploadPaymentInfo _paymentInfo;

  Future<void> upload(
      {String firstName,
      String middleName,
      String lastName,
      String email,
      String mobileNumber,
      String agentEmail,
      String validId,
      String scheduleURL,
      String proofOfPayment}) async {
    emit(PaymentUploadLoading());
    await Future.delayed(Duration(seconds: 2));

    await _paymentInfo(
      PaymentInfoParams(
          agentEmail: agentEmail,
          email: email,
          firstName: firstName,
          lastName: lastName,
          middleName: middleName,
          mobileNumber: mobileNumber,
          proofOfPayment: proofOfPayment,
          scheduleURL: scheduleURL,
          validId: validId),
    );
    emit(PaymentUploadSuccess());
    print('Success');
  }
}
