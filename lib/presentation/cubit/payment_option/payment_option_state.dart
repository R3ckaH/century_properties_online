part of 'payment_option_cubit.dart';

abstract class PaymentOptionState extends Equatable {
  const PaymentOptionState();
  @override
  List<Object> get props => [];

}


class PaymentOptionInitial extends PaymentOptionState {}

class PaymentOptionLoading extends PaymentOptionState{}

class PaymentOptionLoaded extends PaymentOptionState{
  final List<PaymentOption> paymentOptions;

  PaymentOptionLoaded(this.paymentOptions);
  @override
  List<Object> get props => [paymentOptions];
}

class PaymentOptionError extends PaymentOptionState {
  final String message;

  PaymentOptionError(this.message);

  @override
  List<Object> get props => [message];
}