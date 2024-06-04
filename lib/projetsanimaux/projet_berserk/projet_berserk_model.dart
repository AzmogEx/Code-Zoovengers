import '/flutter_flow/flutter_flow_util.dart';
import 'projet_berserk_widget.dart' show ProjetBerserkWidget;
import 'package:flutter/material.dart';

class ProjetBerserkModel extends FlutterFlowModel<ProjetBerserkWidget> {
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
