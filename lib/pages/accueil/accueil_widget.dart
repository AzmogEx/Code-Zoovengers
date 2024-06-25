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
      if (FFAppState().continuer == true) {
        _model.timerController.onStopTimer();
      } else {
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
              setState(() {});
            }
          }),
          Future(() async {
            if ((FFAppState().countDown < 1800000) &&
                (FFAppState().countDown > 600000)) {
              setState(() {});

              setState(() {});
            }
          }),
        ]);
      }
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
        body: SafeArea(
          top: true,
          child: Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/fond.png',
                ).image,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppBar(
                        backgroundColor: FlutterFlowTheme.of(context).primary,
                        automaticallyImplyLeading: false,
                        title: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'ooph7t6l' /* Zoovengers */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Oswald',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 30.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                        actions: const [],
                        centerTitle: false,
                        elevation: 0.0,
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'kopltei7' /* L'agence zoovengers vous souha... */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  fontFamily: 'Oswald',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              16.0, 16.0, 16.0, 16.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              '3ig8uae0' /* Pourrez vous résoudre à temps ... */,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Oswald',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 100.0,
                          decoration: const BoxDecoration(
                            color: Color(0x007A90A4),
                          ),
                          child: Visibility(
                            visible: FFAppState().continuer == false,
                            child: Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowTimer(
                                initialTime: FFAppState().countDown,
                                getDisplayTime: (value) =>
                                    StopWatchTimer.getDisplayTime(
                                  value,
                                  hours: false,
                                  milliSecond: false,
                                ),
                                controller: _model.timerController,
                                updateStateInterval:
                                    const Duration(milliseconds: 1000),
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
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: 'Oswald',
                                      color: FFAppState().couleur,
                                      fontSize: 50.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'x9ypormm' /* Code final d'extraction:  */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Oswald',
                                    color: const Color(0xFF344D59),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      if ((FFAppState().Difficulte == false) &&
                          (FFAppState().continuer == false))
                        Container(
                          width: 399.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: const Color(0x007B5656),
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: Image.asset(
                                'assets/images/adn.png',
                              ).image,
                            ),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                            .mdpfinale
                                            .contains(FFAppState().nbrmdp[0])
                                        ? '5'
                                        : '?',
                                    textAlign: TextAlign.justify,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: Colors.white,
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                            .mdpfinale
                                            .contains(FFAppState().nbrmdp[1])
                                        ? '4'
                                        : '?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: Colors.white,
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                            .mdpfinale
                                            .contains(FFAppState().nbrmdp[2])
                                        ? '9'
                                        : '?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: Colors.white,
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                            .mdpfinale
                                            .contains(FFAppState().nbrmdp[3])
                                        ? '7'
                                        : '?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: Colors.white,
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                            .mdpfinale
                                            .contains(FFAppState().nbrmdp[4])
                                        ? '2'
                                        : '?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: Colors.white,
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 65.0)),
                            ),
                          ),
                        ),
                      if ((FFAppState().continuer == true) &&
                          (FFAppState().Difficulte == false))
                        Container(
                          width: 399.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: const Color(0x007B5656),
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: Image.asset(
                                'assets/images/adn.png',
                              ).image,
                            ),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        5.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      FFAppState()
                                              .mdpfinale
                                              .contains(FFAppState().nbrmdp[5])
                                          ? '6'
                                          : '?',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            fontSize: 30.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w900,
                                          ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                            .mdpfinale
                                            .contains(FFAppState().nbrmdp[6])
                                        ? '3'
                                        : '?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                            .mdpfinale
                                            .contains(FFAppState().nbrmdp[7])
                                        ? '1'
                                        : '?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                            .mdpfinale
                                            .contains(FFAppState().nbrmdp[8])
                                        ? '8'
                                        : '?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 5.0, 0.0),
                                    child: Text(
                                      FFAppState()
                                              .mdpfinale
                                              .contains(FFAppState().nbrmdp[9])
                                          ? '4'
                                          : '?',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            fontSize: 30.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w900,
                                          ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 65.0)),
                            ),
                          ),
                        ),
                      if ((FFAppState().continuer == false) &&
                          (FFAppState().Difficulte == true))
                        Container(
                          width: 399.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: const Color(0x007B5656),
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: Image.asset(
                                'assets/images/adn.png',
                              ).image,
                            ),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                            .mdpfinale
                                            .contains(FFAppState().nbrmdp[0])
                                        ? '6'
                                        : '?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                            .mdpfinale
                                            .contains(FFAppState().nbrmdp[1])
                                        ? '3'
                                        : '?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                            .mdpfinale
                                            .contains(FFAppState().nbrmdp[2])
                                        ? '1'
                                        : '?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                            .mdpfinale
                                            .contains(FFAppState().nbrmdp[3])
                                        ? '8'
                                        : '?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                            .mdpfinale
                                            .contains(FFAppState().nbrmdp[4])
                                        ? '4'
                                        : '?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 65.0)),
                            ),
                          ),
                        ),
                      if ((FFAppState().continuer == true) &&
                          (FFAppState().Difficulte == true))
                        Container(
                          width: 399.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: const Color(0x007B5656),
                            image: DecorationImage(
                              fit: BoxFit.contain,
                              image: Image.asset(
                                'assets/images/adn.png',
                              ).image,
                            ),
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                            .mdpfinale
                                            .contains(FFAppState().nbrmdp[5])
                                        ? '6'
                                        : '?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                            .mdpfinale
                                            .contains(FFAppState().nbrmdp[6])
                                        ? '3'
                                        : '?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                            .mdpfinale
                                            .contains(FFAppState().nbrmdp[7])
                                        ? '1'
                                        : '?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                            .mdpfinale
                                            .contains(FFAppState().nbrmdp[8])
                                        ? '8'
                                        : '?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    FFAppState()
                                            .mdpfinale
                                            .contains(FFAppState().nbrmdp[9])
                                        ? '4'
                                        : '?',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          fontSize: 30.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 65.0)),
                            ),
                          ),
                        ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 1.0),
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: const BoxDecoration(),
                          child: AlignedTooltip(
                            content: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                FFAppState().MessNot[1],
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Oswald',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                            ),
                            offset: 4.0,
                            preferredDirection: AxisDirection.down,
                            borderRadius: BorderRadius.circular(8.0),
                            backgroundColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            elevation: 4.0,
                            tailBaseWidth: 40.0,
                            tailLength: 12.0,
                            waitDuration: const Duration(milliseconds: 100),
                            showDuration: const Duration(milliseconds: 2000),
                            triggerMode: TooltipTriggerMode.tap,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/Design_sans_titre.png',
                                width: 300.0,
                                height: 200.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
