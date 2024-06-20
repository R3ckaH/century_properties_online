import 'package:equatable/equatable.dart';

class PaymentOption extends Equatable {
  PaymentOption({
    this.termId,
    this.termDescription,
    this.downPayment,
    this.monthlyAmortization,
    this.balloonPayment,
    this.turnoverBalance,
    this.totalContractPrice,
    this.unitPriceWithVAT,
    this.totalPriceWithVAT,
    this.furnishedPrice,
  });

  final int termId;
  final String termDescription;
  final String downPayment;
  final String monthlyAmortization;
  final String balloonPayment;
  final String turnoverBalance;
  final String totalContractPrice;
  final double unitPriceWithVAT;
  final double totalPriceWithVAT;
  final double furnishedPrice;

  @override
  List<Object> get props => [termId, termDescription, downPayment, monthlyAmortization, balloonPayment, turnoverBalance, totalContractPrice, unitPriceWithVAT, totalPriceWithVAT, furnishedPrice];
}
