import '/flutter_flow/flutter_flow_util.dart';
import 'marsupial_widget.dart' show MarsupialWidget;
import 'package:flutter/material.dart';

class MarsupialModel extends FlutterFlowModel<MarsupialWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
