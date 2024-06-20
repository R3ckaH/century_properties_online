part of 'payment_upload_cubit.dart';

abstract class PaymentUploadState extends Equatable {
  const PaymentUploadState();

  @override
  List<Object> get props => [];
}

class PaymentUploadInitial extends PaymentUploadState {}

class PaymentUploadLoading extends PaymentUploadState {}

class PaymentUploadSuccess extends PaymentUploadState {}
