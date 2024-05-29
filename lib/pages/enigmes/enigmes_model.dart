import '/flutter_flow/flutter_flow_util.dart';
import 'enigmes_widget.dart' show EnigmesWidget;
import 'package:flutter/material.dart';

class EnigmesModel extends FlutterFlowModel<EnigmesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
