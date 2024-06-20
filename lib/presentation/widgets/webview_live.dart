import 'package:century_mobile/presentation/cubit/live_view/live_view_cubit.dart';
import 'package:century_mobile/presentation/widgets/components/_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WebViewLive extends StatelessWidget {
  final isSpinning;
  final String url;
  WebViewLive(this.url, {this.isSpinning});

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      progressIndicator: CustomLoading(),
      inAsyncCall: isSpinning,
      child: WebView(
        onPageFinished: (finished) {
          context.read<LiveViewCubit>().onPageFinished();
        },
        onPageStarted: (started) {
          context.read<LiveViewCubit>().onPageStarted();
        },
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        gestureRecognizers: Set()
          ..add(
            Factory<VerticalDragGestureRecognizer>(
              () => VerticalDragGestureRecognizer(),
            ),
          ),
      ),
    );
  }
}
