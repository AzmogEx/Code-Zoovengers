import '/flutter_flow/flutter_flow_util.dart';
import 'password_widget.dart' show PasswordWidget;
import 'package:flutter/material.dart';

class PasswordModel extends FlutterFlowModel<PasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for PassWord widget.
  FocusNode? passWordFocusNode;
  TextEditingController? passWordTextController;
  String? Function(BuildContext, String?)? passWordTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    passWordFocusNode?.dispose();
    passWordTextController?.dispose();
  }
}
