import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'decryptek_widget.dart' show DecryptekWidget;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';

class DecryptekModel extends FlutterFlowModel<DecryptekWidget> {
  ///  State fields for stateful widgets in this page.

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

  // State field(s) for PageView widget.
  PageController? pageViewController1;

  int get pageViewCurrentIndex1 => pageViewController1 != null &&
          pageViewController1!.hasClients &&
          pageViewController1!.page != null
      ? pageViewController1!.page!.round()
      : 0;
  // State field(s) for PageView widget.
  PageController? pageViewController2;

  int get pageViewCurrentIndex2 => pageViewController2 != null &&
          pageViewController2!.hasClients &&
          pageViewController2!.page != null
      ? pageViewController2!.page!.round()
      : 0;
  // State field(s) for PageView widget.
  PageController? pageViewController3;

  int get pageViewCurrentIndex3 => pageViewController3 != null &&
          pageViewController3!.hasClients &&
          pageViewController3!.page != null
      ? pageViewController3!.page!.round()
      : 0;
  // State field(s) for PageView widget.
  PageController? pageViewController4;

  int get pageViewCurrentIndex4 => pageViewController4 != null &&
          pageViewController4!.hasClients &&
          pageViewController4!.page != null
      ? pageViewController4!.page!.round()
      : 0;
  // State field(s) for PageView widget.
  PageController? pageViewController5;

  int get pageViewCurrentIndex5 => pageViewController5 != null &&
          pageViewController5!.hasClients &&
          pageViewController5!.page != null
      ? pageViewController5!.page!.round()
      : 0;
  // State field(s) for PageView widget.
  PageController? pageViewController6;

  int get pageViewCurrentIndex6 => pageViewController6 != null &&
          pageViewController6!.hasClients &&
          pageViewController6!.page != null
      ? pageViewController6!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    timerController.dispose();
  }
}
