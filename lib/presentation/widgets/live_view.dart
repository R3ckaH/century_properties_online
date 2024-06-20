import '../cubit/live_view/live_view_cubit.dart';
import '_widgets.dart';
import 'components/custom_text_lato.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LiveView extends StatelessWidget {
  const LiveView(
    this.url, {
    Key key,
  }) : super(key: key);
  final String url;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 530,
        width: double.infinity,
        child: url != null
            ? BlocBuilder<LiveViewCubit, LiveViewState>(
                builder: (context, state) {
                  if (state is LiveViewInitial) {
                    return WebViewLive(
                      url,
                      isSpinning: state.isSpinning,
                    );
                  } else if (state is LiveViewLoaded) {
                    return WebViewLive(
                      url,
                      isSpinning: state.isSpinning,
                    );
                  }
                  return Container();
                },
              )
            : Center(
                child: CustomTextLato('The Building has no live feed'),
              ));
  }
}
