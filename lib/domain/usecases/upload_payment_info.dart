import 'package:century_mobile/domain/repositories/century_properties_repository.dart';
import 'package:equatable/equatable.dart';

class UploadPaymentInfo {
  final CenturyPropertiesRepository _repo;

  UploadPaymentInfo(this._repo);

  Future<void> call(PaymentInfoParams params) async =>
      await _repo.uploadPaymentInfo(
          email: params.email,
          agentEmail: params.agentEmail,
          firstName: params.firstName,
          lastName: params.lastName,
          middleName: params.middleName,
          mobileNumber: params.mobileNumber,
          proofOfPayment: params.proofOfPayment,
          validId: params.validId,
          scheduleURL: params.scheduleURL);
}

class PaymentInfoParams extends Equatable {
  final String firstName;
  final String middleName;
  final String lastName;
  final String email;
  final String mobileNumber;
  final String agentEmail;
  final String validId;
  final String proofOfPayment;
  final String scheduleURL;
  PaymentInfoParams(
      {this.firstName,
      this.middleName,
      this.lastName,
      this.email,
      this.mobileNumber,
      this.agentEmail,
      this.validId,
      this.scheduleURL,
      this.proofOfPayment});

  @override
  List<Object> get props {
    return [
      firstName,
      middleName,
      lastName,
      email,
      mobileNumber,
      agentEmail,
      validId,
      proofOfPayment,
      scheduleURL,
    ];
  }
}
