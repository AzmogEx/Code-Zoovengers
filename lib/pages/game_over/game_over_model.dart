import '/flutter_flow/flutter_flow_util.dart';
import 'game_over_widget.dart' show GameOverWidget;
import 'package:flutter/material.dart';

class GameOverModel extends FlutterFlowModel<GameOverWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
