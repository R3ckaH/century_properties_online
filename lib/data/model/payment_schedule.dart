import 'package:century_mobile/domain/entities/payment_schedule.dart';

class PaymentScheduleModel extends PaymentSchedule {
  final int monthCount;
  final String scheduleDate;
  final String description;
  final double unitAmount;
  final double parkingAmount;
  final double storageAmount;
  final double furnishedAmount;
  final double gMTOEAmount;
  final double totalAmount;

  PaymentScheduleModel({
    this.monthCount,
    this.scheduleDate,
    this.description,
    this.unitAmount,
    this.parkingAmount,
    this.storageAmount,
    this.furnishedAmount,
    this.gMTOEAmount,
    this.totalAmount,
  }) : super(
          monthCount: monthCount,
          scheduleDate: scheduleDate,
          description: description,
          unitAmount: unitAmount,
          parkingAmount: parkingAmount,
          storageAmount: storageAmount,
          furnishedAmount: furnishedAmount,
          gMTOEAmount: gMTOEAmount,
          totalAmount: totalAmount,
        );

  factory PaymentScheduleModel.fromJson(Map<String, dynamic> json) =>
      PaymentScheduleModel(
        monthCount: json["month_count"],
        scheduleDate: json["schedule_date"],
        description: json["description"],
        unitAmount: json["unit_amount"],
        parkingAmount: json["parking_amount"],
        storageAmount: json["storage_amount"],
        furnishedAmount: json["furnished_amount"],
        gMTOEAmount: json["gmtoe_amount"],
        totalAmount: json["total_amount"],
      );

  Map<String, dynamic> toJson() => {
        "month_count": monthCount,
        "schedule_date": scheduleDate,
        "description": description,
        "unit_amount": unitAmount,
        "parking_amount": parkingAmount,
        "storage_amount": storageAmount,
        "furnished_amount": furnishedAmount,
        "gmtoe_amount": gMTOEAmount,
        "total_amount": scheduleDate,
      };
}
