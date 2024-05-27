import '/flutter_flow/flutter_flow_util.dart';
import 'decryptek_widget.dart' show DecryptekWidget;
import 'package:flutter/material.dart';

class DecryptekModel extends FlutterFlowModel<DecryptekWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
