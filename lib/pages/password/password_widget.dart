import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'password_model.dart';
export 'password_model.dart';

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({super.key});

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  late PasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PasswordModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.timerController.onStartTimer();
      while (FFAppState().countDown != null) {
        FFAppState().countDown = _model.timerMilliseconds;
        setState(() {});
        await Future.delayed(const Duration(milliseconds: 200));
      }
    });

    _model.passWordTextController ??= TextEditingController();
    _model.passWordFocusNode ??= FocusNode();

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
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
                    fontFamily: 'Urbanist',
                    fontSize: 40.0,
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Align(
        alignment: const AlignmentDirectional(0.0, -1.0),
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            maxWidth: 570.0,
          ),
          decoration: const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // This row exists for when the "app bar" is hidden on desktop, having a way back for the user can work well.
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.safePop();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 12.0),
                            child: Icon(
                              Icons.arrow_back_rounded,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '2oun6orm' /* Back */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'zx2l5tcm' /* Mots de passe final: */,
                      ),
                      style:
                          FlutterFlowTheme.of(context).headlineMedium.override(
                                fontFamily: 'Urbanist',
                                letterSpacing: 0.0,
                              ),
                    ),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0.0, 0.0),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        '0eejz8ik' /* Attention vous n'avez le droit... */,
                      ),
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Manrope',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.passWordTextController,
                      focusNode: _model.passWordFocusNode,
                      autofocus: false,
                      autofillHints: const [AutofillHints.password],
                      obscureText: false,
                      decoration: InputDecoration(
                        labelText: FFLocalizations.of(context).getText(
                          'r90vn38u' /* Mots de passe final: */,
                        ),
                        labelStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Manrope',
                                  letterSpacing: 0.0,
                                ),
                        hintStyle:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Manrope',
                                  letterSpacing: 0.0,
                                ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).alternate,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).primary,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: FlutterFlowTheme.of(context).error,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 24.0, 20.0, 24.0),
                        prefixIcon: const Icon(
                          Icons.password,
                        ),
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            letterSpacing: 0.0,
                          ),
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      cursorColor: FlutterFlowTheme.of(context).primary,
                      validator: _model.passWordTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ),
                if (FFAppState().animSend)
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Lottie.network(
                      'https://lottie.host/a03effb3-777a-455b-b9da-156fd42061cb/DSjVZlzKmT.json',
                      width: 311.0,
                      height: 130.0,
                      fit: BoxFit.cover,
                      animate: true,
                    ),
                  ),
                if (FFAppState().animVerif)
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Lottie.network(
                      'https://lottie.host/9bc464c8-a813-4b20-9537-a90b6b7ec77b/X1ee2TnmjJ.json',
                      width: 188.0,
                      height: 152.0,
                      fit: BoxFit.cover,
                      animate: true,
                    ),
                  ),
                Flexible(
                  child: Align(
                    alignment: const AlignmentDirectional(0.0, 1.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          16.0, 24.0, 16.0, 50.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          if (_model.passWordTextController.text == '12345') {
                            FFAppState().animVerif = true;
                            setState(() {});
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Verification des fichiers adn !',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor: const Color(0xFF7335D0),
                              ),
                            );
                            await Future.delayed(
                                const Duration(milliseconds: 8000));
                            FFAppState().animVerif = false;
                            setState(() {});
                            FFAppState().animSend = true;
                            setState(() {});
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Fichier en cours d\'envoi sur les serveurs de l\'agence !',
                                  style: TextStyle(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                  ),
                                ),
                                duration: const Duration(milliseconds: 4000),
                                backgroundColor: const Color(0xFF41E822),
                              ),
                            );
                            await Future.delayed(
                                const Duration(milliseconds: 5000));
                            FFAppState().animSend = false;
                            setState(() {});

                            context.pushNamed('Win');
                          } else {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: const Text('ERREUR'),
                                  content: const Text(
                                      'le code que vous avez envoyer n\'est pas bon'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: const Text('reesayyer'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        text: FFLocalizations.of(context).getText(
                          'i2y6xlm4' /* Envoyer: */,
                        ),
                        options: FFButtonOptions(
                          width: double.infinity,
                          height: 50.0,
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                          elevation: 3.0,
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
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
