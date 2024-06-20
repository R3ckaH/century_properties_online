part of 'live_view_cubit.dart';

abstract class LiveViewState extends Equatable {
  const LiveViewState();

  @override
  List<Object> get props => [];
}

class LiveViewInitial extends LiveViewState {
  final bool isSpinning;

  LiveViewInitial({this.isSpinning = true});

  @override
  List<Object> get props => [isSpinning];
}

class LiveViewLoaded extends LiveViewState {
  final bool isSpinning;

  LiveViewLoaded(this.isSpinning);

  @override
  List<Object> get props => [isSpinning];
}
