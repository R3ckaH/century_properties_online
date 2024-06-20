part of 'payment_schedule_cubit.dart';

abstract class PaymentScheduleState extends Equatable {
  const PaymentScheduleState();
  @override
  List<Object> get props => [];
}

class PaymentScheduleInitial extends PaymentScheduleState {}

class PaymentScheduleLoading extends PaymentScheduleState {}

class PaymentScheduleLoaded extends PaymentScheduleState {
  final List<PaymentSchedule> paymentSchedules;

  PaymentScheduleLoaded(this.paymentSchedules);
  @override
  List<Object> get props => [paymentSchedules];
}

class PaymentScheduleError extends PaymentScheduleState {
  final String message;

  PaymentScheduleError(this.message);

  @override
  List<Object> get props => [message];
}
