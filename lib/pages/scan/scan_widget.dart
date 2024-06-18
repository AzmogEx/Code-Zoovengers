import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'scan_model.dart';
export 'scan_model.dart';

class ScanWidget extends StatefulWidget {
  const ScanWidget({super.key});

  @override
  State<ScanWidget> createState() => _ScanWidgetState();
}

class _ScanWidgetState extends State<ScanWidget> {
  late ScanModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScanModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
      await Future.wait([
        Future(() async {
          while (FFAppState().adnScan.contains(_model.adnScan)) {
            FFAppState().addToAdnScan(_model.adnScan);
            setState(() {});
            await Future.delayed(const Duration(milliseconds: 200));
          }
        }),
        Future(() async {
          if (FFAppState().continuer == true) {
            _model.timerController.onStopTimer();
          } else {
            _model.timerController.onStartTimer();
            while (FFAppState().countDown != null) {
              FFAppState().countDown = _model.timerMilliseconds;
              setState(() {});
              await Future.delayed(const Duration(milliseconds: 200));
            }
          }
        }),
      ]);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: const Color(0xFF7A90A4),
        appBar: AppBar(
          backgroundColor: const Color(0xFF344D59),
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(-1.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'przuw6rp' /* Scan QR Code */,
              ),
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    fontFamily: 'Oswald',
                    color: FlutterFlowTheme.of(context).primaryText,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
          actions: [
            Visibility(
              visible: FFAppState().continuer == false,
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 20.0, 0.0),
                child: FlutterFlowTimer(
                  initialTime: FFAppState().countDown,
                  getDisplayTime: (value) => StopWatchTimer.getDisplayTime(
                    value,
                    hours: false,
                    milliSecond: false,
                  ),
                  controller: _model.timerController,
                  updateStateInterval: const Duration(milliseconds: 1000),
                  onChanged: (value, displayTime, shouldUpdate) {
                    _model.timerMilliseconds = value;
                    _model.timerValue = displayTime;
                    if (shouldUpdate) setState(() {});
                  },
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Oswald',
                        fontSize: 30.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '3ys739fc' /* Placez le qr code au milieu du... */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Oswald',
                        color: Colors.white,
                        fontSize: 13.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Container(
                  width: 267.0,
                  height: 300.0,
                  decoration: BoxDecoration(
                    color: const Color(0xFF344D59),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Icon(
                      Icons.qr_code_scanner,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 128.0,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      _model.adnScan = await FlutterBarcodeScanner.scanBarcode(
                        '#C62828', // scanning line color
                        FFLocalizations.of(context).getText(
                          'dmvdpma6' /* Annuler */,
                        ), // cancel button text
                        true, // whether to show the flash icon
                        ScanMode.QR,
                      );

                      FFAppState().addToAdnScan(_model.adnScan);
                      setState(() {});
                      if (!FFAppState().Difficulte) {
                        await Future.wait([
                          Future(() async {
                            if (FFAppState().adnScan.contains('FANTOME')) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Attention, vous ne pouvez pas scanner d\'ADN difficile dans ce mode de jeu !',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor: const Color(0xFFFF0004),
                                ),
                              );
                              FFAppState().removeFromAdnScan('FANTOME');
                              setState(() {});
                            }
                          }),
                          Future(() async {
                            if (FFAppState().adnScan.contains('HYGROCHROME')) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Attention, vous ne pouvez pas scanner d\'ADN difficile dans ce mode de jeu !',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor: const Color(0xFFFF0004),
                                ),
                              );
                              FFAppState().removeFromAdnScan('HYGROCHROME');
                              setState(() {});
                            }
                          }),
                          Future(() async {
                            if (FFAppState().adnScan.contains('TASMANIE')) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Attention, vous ne pouvez pas scanner d\'ADN difficile dans ce mode de jeu !',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor: const Color(0xFFFF0004),
                                ),
                              );
                              FFAppState().removeFromAdnScan('TASMANIE');
                              setState(() {});
                            }
                          }),
                          Future(() async {
                            if (FFAppState().adnScan.contains('ECLAIR')) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Attention, vous ne pouvez pas scanner d\'ADN difficile dans ce mode de jeu !',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor: const Color(0xFFFF0004),
                                ),
                              );
                              FFAppState().removeFromAdnScan('ECLAIR');
                              setState(() {});
                            }
                          }),
                          Future(() async {
                            if (FFAppState().adnScan.contains('MARSUPIAL')) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Attention, vous ne pouvez pas scanner d\'ADN difficile dans ce mode de jeu !',
                                    style: TextStyle(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                  ),
                                  duration: const Duration(milliseconds: 4000),
                                  backgroundColor: const Color(0xFFFF0004),
                                ),
                              );
                              FFAppState().removeFromAdnScan('MARSUPIAL');
                              setState(() {});
                            }
                          }),
                        ]);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'ADN Correctement scanner, projet ajouter dans la section enigme !',
                            style: TextStyle(
                              color: FlutterFlowTheme.of(context).primaryText,
                            ),
                          ),
                          duration: const Duration(milliseconds: 4000),
                          backgroundColor: const Color(0xFF3CEF26),
                        ),
                      );

                      setState(() {});
                    },
                    text: FFLocalizations.of(context).getText(
                      'mj2zm0k2' /* Démarrer le scan */,
                    ),
                    options: FFButtonOptions(
                      width: 200.0,
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: const Color(0xFF344D59),
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Oswald',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
