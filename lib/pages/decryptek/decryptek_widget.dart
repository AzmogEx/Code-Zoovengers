import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'decryptek_model.dart';
export 'decryptek_model.dart';

class DecryptekWidget extends StatefulWidget {
  const DecryptekWidget({super.key});

  @override
  State<DecryptekWidget> createState() => _DecryptekWidgetState();
}

class _DecryptekWidgetState extends State<DecryptekWidget> {
  late DecryptekModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DecryptekModel());

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
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  FFLocalizations.of(context).getText(
                    'tqoumjk3' /* Decryptek */,
                  ),
                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                        fontFamily: 'Urbanist',
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                      ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '21s8o4jm' /* Bienvenue sur le decryptek! Ut... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
                FlutterFlowTimer(
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
                        fontFamily: 'Urbanist',
                        fontSize: 40.0,
                        letterSpacing: 0.0,
                      ),
                ),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: 500.0,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 40.0),
                          child: PageView(
                            controller: _model.pageViewController ??=
                                PageController(initialPage: 0),
                            scrollDirection: Axis.horizontal,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: Image.asset(
                                          'assets/images/eclair-final.png',
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: true,
                                        tag: 'imageTag1',
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: 'imageTag1',
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/eclair-final.png',
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      child: FlutterFlowExpandedImageView(
                                        image: Image.asset(
                                          'assets/images/fantome-final.png',
                                          fit: BoxFit.contain,
                                        ),
                                        allowRotation: true,
                                        tag: 'imageTag2',
                                        useHeroAnimation: true,
                                      ),
                                    ),
                                  );
                                },
                                child: Hero(
                                  tag: 'imageTag2',
                                  transitionOnUserGestures: true,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.asset(
                                      'assets/images/fantome-final.png',
                                      width: 337.0,
                                      height: 469.0,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/eclair-final.png',
                                  width: 300.0,
                                  height: 200.0,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/fantome-final.png',
                                  width: 300.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.asset(
                                  'assets/images/marsupial-final.png',
                                  width: 300.0,
                                  height: 200.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(-1.0, 1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 16.0),
                            child: smooth_page_indicator.SmoothPageIndicator(
                              controller: _model.pageViewController ??=
                                  PageController(initialPage: 0),
                              count: 5,
                              axisDirection: Axis.horizontal,
                              onDotClicked: (i) async {
                                await _model.pageViewController!.animateToPage(
                                  i,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                                setState(() {});
                              },
                              effect: smooth_page_indicator.ExpandingDotsEffect(
                                expansionFactor: 3.0,
                                spacing: 8.0,
                                radius: 16.0,
                                dotWidth: 16.0,
                                dotHeight: 8.0,
                                dotColor: FlutterFlowTheme.of(context).accent1,
                                activeDotColor:
                                    FlutterFlowTheme.of(context).primary,
                                paintStyle: PaintingStyle.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
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
