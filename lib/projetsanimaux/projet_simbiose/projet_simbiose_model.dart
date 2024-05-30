import '/flutter_flow/flutter_flow_util.dart';
import 'projet_simbiose_widget.dart' show ProjetSimbioseWidget;
import 'package:flutter/material.dart';

class ProjetSimbioseModel extends FlutterFlowModel<ProjetSimbioseWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
