import '/flutter_flow/flutter_flow_util.dart';
import 'scan_widget.dart' show ScanWidget;
import 'package:flutter/material.dart';

class ScanModel extends FlutterFlowModel<ScanWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  var adnScan = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
