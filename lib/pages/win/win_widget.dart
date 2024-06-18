import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'win_model.dart';
export 'win_model.dart';

class WinWidget extends StatefulWidget {
  const WinWidget({super.key});

  @override
  State<WinWidget> createState() => _WinWidgetState();
}

class _WinWidgetState extends State<WinWidget> {
  late WinModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WinModel());

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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_outline_rounded,
                color: FlutterFlowTheme.of(context).secondary,
                size: 160.0,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '910ep2k8' /* Félicitation */,
                  ),
                  style: FlutterFlowTheme.of(context).displayLarge.override(
                        fontFamily: 'Oswald',
                        color: FlutterFlowTheme.of(context).primaryText,
                        fontSize: 50.0,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 100.0),
                child: Text(
                  FFLocalizations.of(context).getText(
                    '0qttfj54' /* Vous avez réussi à retrouvez t... */,
                  ),
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Oswald',
                        color: Colors.white,
                        letterSpacing: 0.0,
                      ),
                ),
              ),
              FlutterFlowTimer(
                initialTime: valueOrDefault<int>(
                  FFAppState().deuxheures - FFAppState().countDown,
                  0,
                ),
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
                      fontSize: 40.0,
                      letterSpacing: 0.0,
                    ),
              ),
              if (FFAppState().continuer == false)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      FFAppState().continuer = true;
                      setState(() {});

                      context.pushNamed('Accueil');
                    },
                    text: FFLocalizations.of(context).getText(
                      'pzor89sk' /* Continuer ? */,
                    ),
                    options: FFButtonOptions(
                      width: 130.0,
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
                      elevation: 3.0,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    FFAppState().berserk = false;
                    FFAppState().eclair = false;
                    FFAppState().marsupilan = false;
                    FFAppState().fantome = false;
                    FFAppState().tasmanie = false;
                    FFAppState().countDown = 360000;
                    FFAppState().Difficulte = false;
                    FFAppState().axoloth = false;
                    FFAppState().simbioz = false;
                    FFAppState().sentinelle = false;
                    FFAppState().ressort = false;
                    FFAppState().hygrochrome = false;
                    FFAppState().deuxheures = 720000;
                    FFAppState().animSend = false;
                    FFAppState().animVerif = false;
                    FFAppState().adnScan = [];
                    FFAppState().continuer = false;
                    FFAppState().NbrEnigmesFait = 0;
                    FFAppState().mdpfinale = [];
                    setState(() {});

                    context.pushNamed('Start');
                  },
                  text: FFLocalizations.of(context).getText(
                    '5cvalrt8' /* Rejouer */,
                  ),
                  options: FFButtonOptions(
                    width: 130.0,
                    height: 50.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: const Color(0xFF344D59),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Oswald',
                          color: Colors.white,
                          letterSpacing: 0.0,
                        ),
                    elevation: 3.0,
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
