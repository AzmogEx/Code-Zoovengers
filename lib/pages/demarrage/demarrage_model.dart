import '/flutter_flow/flutter_flow_util.dart';
import 'demarrage_widget.dart' show DemarrageWidget;
import 'package:flutter/material.dart';

class DemarrageModel extends FlutterFlowModel<DemarrageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
