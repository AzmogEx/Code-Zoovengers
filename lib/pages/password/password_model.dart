import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'password_widget.dart' show PasswordWidget;
import 'package:flutter/material.dart';

class PasswordModel extends FlutterFlowModel<PasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PassWord widget.
  FocusNode? passWordFocusNode;
  TextEditingController? passWordTextController;
  late bool passWordVisibility;
  String? Function(BuildContext, String?)? passWordTextControllerValidator;
  // State field(s) for Timer widget.
  final timerInitialTimeMs = 0;
  int timerMilliseconds = 0;
  String timerValue = StopWatchTimer.getDisplayTime(
    0,
    hours: false,
    milliSecond: false,
  );
  FlutterFlowTimerController timerController =
      FlutterFlowTimerController(StopWatchTimer(mode: StopWatchMode.countDown));

  @override
  void initState(BuildContext context) {
    passWordVisibility = false;
  }

  @override
  void dispose() {
    passWordFocusNode?.dispose();
    passWordTextController?.dispose();

    timerController.dispose();
  }
}
