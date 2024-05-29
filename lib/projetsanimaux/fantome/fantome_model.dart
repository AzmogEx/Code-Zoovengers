import '/flutter_flow/flutter_flow_util.dart';
import 'fantome_widget.dart' show FantomeWidget;
import 'package:flutter/material.dart';

class FantomeModel extends FlutterFlowModel<FantomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
