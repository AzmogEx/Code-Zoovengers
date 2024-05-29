import '/flutter_flow/flutter_flow_util.dart';
import 'berserk_widget.dart' show BerserkWidget;
import 'package:flutter/material.dart';

class BerserkModel extends FlutterFlowModel<BerserkWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
