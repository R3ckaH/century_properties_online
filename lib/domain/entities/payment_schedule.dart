import 'package:equatable/equatable.dart';

class PaymentSchedule extends Equatable {
  PaymentSchedule({
    this.monthCount,
    this.scheduleDate,
    this.description,
    this.unitAmount,
    this.parkingAmount,
    this.storageAmount,
    this.furnishedAmount,
    this.gMTOEAmount,
    this.totalAmount,
  });
  final int monthCount;
  final String scheduleDate;
  final String description;
  final double unitAmount;
  final double parkingAmount;
  final double storageAmount;
  final double furnishedAmount;
  final double gMTOEAmount;
  final double totalAmount;

  @override
  List<Object> get props => [
        monthCount,
        scheduleDate,
        description,
        unitAmount,
        parkingAmount,
        storageAmount,
        furnishedAmount,
        gMTOEAmount,
        totalAmount
      ];
}
