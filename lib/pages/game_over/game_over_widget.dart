import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'game_over_model.dart';
export 'game_over_model.dart';

class GameOverWidget extends StatefulWidget {
  const GameOverWidget({super.key});

  @override
  State<GameOverWidget> createState() => _GameOverWidgetState();
}

class _GameOverWidgetState extends State<GameOverWidget> {
  late GameOverModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => GameOverModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(32.0, 16.0, 32.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'me9kbrcb' /* Game Over */,
                    ),
                    style: FlutterFlowTheme.of(context).displayLarge.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, -1.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '5fys4m2n' /* Vous ne vous êtes pas échappez... */,
                      ),
                      textAlign: TextAlign.center,
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Manrope',
                            color: FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 10.0, 0.0, 0.0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      context.pushNamed('Start');
                    },
                    text: FFLocalizations.of(context).getText(
                      'n7c8br8i' /* Try Again */,
                    ),
                    options: FFButtonOptions(
                      width: 200.0,
                      height: 50.0,
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Manrope',
                                color: Colors.white,
                                letterSpacing: 0.0,
                              ),
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
