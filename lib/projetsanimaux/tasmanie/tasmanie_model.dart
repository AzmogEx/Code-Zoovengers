import '/flutter_flow/flutter_flow_util.dart';
import 'tasmanie_widget.dart' show TasmanieWidget;
import 'package:flutter/material.dart';

class TasmanieModel extends FlutterFlowModel<TasmanieWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
