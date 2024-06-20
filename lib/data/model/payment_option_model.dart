import 'package:century_mobile/domain/entities/payment_option.dart';

class PaymentOptionModel extends PaymentOption {
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

  PaymentOptionModel(
      {
        this.termId,
        this.termDescription,
        this.downPayment,
        this.monthlyAmortization,
        this.balloonPayment,
        this.turnoverBalance,
        this.totalContractPrice,
        this.unitPriceWithVAT,
        this.totalPriceWithVAT,
        this.furnishedPrice
      }) : super(
        termId: termId,
        termDescription: termDescription,
        downPayment: downPayment,
    monthlyAmortization: monthlyAmortization,
    balloonPayment: balloonPayment,
    turnoverBalance: turnoverBalance,
    totalContractPrice: totalContractPrice,
    unitPriceWithVAT: unitPriceWithVAT,
    totalPriceWithVAT: totalPriceWithVAT,
    furnishedPrice: furnishedPrice,
      );


  factory PaymentOptionModel.fromJson(Map<String, dynamic> json) => PaymentOptionModel(
    termId: json["TermID"],
    termDescription: json["TermDescription"],
    downPayment : json["DownPayment"],
    monthlyAmortization : json["MonthlyAmortization"],
    balloonPayment : json["BalloonPayment"],
    turnoverBalance : json["TurnoverBalance"],
    totalContractPrice: json["TotalContractPrice"],
    unitPriceWithVAT : json["UnitPriceWithVat"],
    totalPriceWithVAT: json["TotalPriceWithVat"],
    furnishedPrice: json["FurnishedPrice"],
  );

  Map<String, dynamic> toJson() => {
    "TermID": termId,
    "TermDescription": termDescription,
    "DownPayment" : downPayment,
    "MonthlyAmortization" : monthlyAmortization,
    "BalloonPayment" : balloonPayment,
     "TurnoverBalance" : turnoverBalance,
    "TotalContractPrice" : totalContractPrice,
    "UnitPriceWithVat" : unitPriceWithVAT,
    "TotalPriceWithVat" : totalPriceWithVAT,
    "FurnishedPrice" : furnishedPrice
  };

}
