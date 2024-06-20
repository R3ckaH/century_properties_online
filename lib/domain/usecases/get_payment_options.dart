import 'package:century_mobile/core/call/usecase.dart';
import 'package:century_mobile/core/error/failure.dart';
import 'package:century_mobile/domain/entities/payment_option.dart';
import 'package:century_mobile/domain/repositories/century_properties_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetPaymentOptions implements UseCase<List<PaymentOption>, GetPaymentOptionParams> {
  final CenturyPropertiesRepository _repo;

  GetPaymentOptions(this._repo);


  @override
    Future<Either<Failure, List<PaymentOption>>> call(GetPaymentOptionParams params) async =>
      await _repo.getPaymentOptions(baseURL: params.baseURL, projectID: params.projectID, unitID:  params.unitID, tag: params.tag, ch: params.ch, ffCode: params.ffCode, isForeign: params.isForeign, parkingID: params.parkingID);
}

class GetPaymentOptionParams extends Equatable {
  final String baseURL;
  final String projectID;
  final String unitID;
  final String tag;
  final String ch;
  final String ffCode;
  final bool  isForeign;
  final String parkingID;

  GetPaymentOptionParams({this.baseURL, this.projectID, this.unitID, this.tag, this.ch, this.ffCode, this.isForeign, this.parkingID});

  @override
  List<Object> get props => [baseURL, projectID, unitID, tag, ch, ffCode, isForeign, parkingID];
}

