import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'accueil_model.dart';
export 'accueil_model.dart';

class AccueilWidget extends StatefulWidget {
  const AccueilWidget({super.key});

  @override
  State<AccueilWidget> createState() => _AccueilWidgetState();
}

class _AccueilWidgetState extends State<AccueilWidget> {
  late AccueilModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AccueilModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
      await Future.wait([
        Future(() async {
          while (FFAppState().countDown != null) {
            FFAppState().countDown = _model.timerMilliseconds;
            setState(() {});
            await Future.delayed(const Duration(milliseconds: 200));
          }
        }),
        Future(() async {
          if (FFAppState().countDown < 1800000) {
            FFAppState().couleur = const Color(0xFFFF0000);
            setState(() {});
          } else {
            if (Theme.of(context).brightness == Brightness.dark) {
              FFAppState().couleur = Colors.white;
              setState(() {});
            } else {
              FFAppState().couleur = Colors.black;
              setState(() {});
            }
          }
        }),
        Future(() async {
          if (FFAppState().countDown < 600000) {
            FFAppState().notification2 = false;
            setState(() {});
            FFAppState().notification = true;
            setState(() {});
          }
        }),
        Future(() async {
          if ((FFAppState().countDown < 1800000) &&
              (FFAppState().countDown > 600000)) {
            FFAppState().notification = false;
            setState(() {});
            FFAppState().notification2 = true;
            setState(() {});
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
                  automaticallyImplyLeading: false,
                  title: Text(
                    FFLocalizations.of(context).getText(
                      '4flophpy' /* Zoovengers: */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 22.0,
                          letterSpacing: 0.0,
                        ),
                  ),
                  actions: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.mode_night_sharp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          if (Theme.of(context).brightness == Brightness.dark) {
                            setDarkModeSetting(context, ThemeMode.light);
                          } else {
                            setDarkModeSetting(context, ThemeMode.dark);
                          }
                        },
                      ),
                    ),
                  ],
                  centerTitle: false,
                  elevation: 0.0,
                ),
                if (FFAppState().notification == true)
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: AlignedTooltip(
                      content: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'h7a358pd' /* Bon dépêche toi un peu ! */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      offset: 4.0,
                      preferredDirection: AxisDirection.down,
                      borderRadius: BorderRadius.circular(8.0),
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 4.0,
                      tailBaseWidth: 24.0,
                      tailLength: 12.0,
                      waitDuration: const Duration(milliseconds: 100),
                      showDuration: const Duration(milliseconds: 1500),
                      triggerMode: TooltipTriggerMode.tap,
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          FFAppState().notification = false;
                          setState(() {});
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            'assets/images/file.png',
                            width: 98.0,
                            height: 108.0,
                            fit: BoxFit.cover,
                            alignment: const Alignment(0.0, 0.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                if (FFAppState().notification == true)
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: AlignedTooltip(
                      content: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'zk93uf01' /* L'agence croit en toi ! */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyLarge.override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                      offset: 4.0,
                      preferredDirection: AxisDirection.down,
                      borderRadius: BorderRadius.circular(8.0),
                      backgroundColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      elevation: 4.0,
                      tailBaseWidth: 24.0,
                      tailLength: 12.0,
                      waitDuration: const Duration(milliseconds: 100),
                      showDuration: const Duration(milliseconds: 1500),
                      triggerMode: TooltipTriggerMode.tap,
                      child: Visibility(
                        visible: FFAppState().notification2 == true,
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().notification = false;
                            setState(() {});
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(
                              'assets/images/file.png',
                              width: 98.0,
                              height: 108.0,
                              fit: BoxFit.cover,
                              alignment: const Alignment(0.0, 0.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'tx5gnfmy' /* L'agence zoovengers vous souha... */,
                    ),
                    style: FlutterFlowTheme.of(context).headlineLarge.override(
                          fontFamily: 'Urbanist',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'kig4qnvv' /* Pourrez vous résoudre à temps ... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color: FlutterFlowTheme.of(context).primaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
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
                      onEnded: () async {
                        context.goNamed('GameOver');

                        _model.soundPlayer ??= AudioPlayer();
                        if (_model.soundPlayer!.playing) {
                          await _model.soundPlayer!.stop();
                        }
                        _model.soundPlayer!.setVolume(1.0);
                        _model.soundPlayer!
                            .setAsset(
                                'assets/audios/SUPER_MARIO_-_game_over_-_sound_effect.mp3')
                            .then((_) => _model.soundPlayer!.play());
                      },
                      textAlign: TextAlign.start,
                      style:
                          FlutterFlowTheme.of(context).headlineSmall.override(
                                fontFamily: 'Urbanist',
                                color: FFAppState().couleur,
                                fontSize: 50.0,
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.5,
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/images/final_sans_fond_zoovengers.png',
                        width: 394.0,
                        height: 415.0,
                        fit: BoxFit.contain,
                      ),
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
