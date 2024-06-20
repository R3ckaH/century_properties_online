import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'live_view_state.dart';

class LiveViewCubit extends Cubit<LiveViewState> {
  LiveViewCubit() : super(LiveViewInitial());

  void onPageFinished() => emit(LiveViewLoaded(false));
  void onPageStarted() => emit(LiveViewLoaded(true));
}
