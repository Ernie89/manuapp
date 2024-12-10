import '/components/bottom_navigation/bottom_navigation_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'powerpoints_model.dart';
export 'powerpoints_model.dart';

class PowerpointsWidget extends StatefulWidget {
  const PowerpointsWidget({super.key});

  @override
  State<PowerpointsWidget> createState() => _PowerpointsWidgetState();
}

class _PowerpointsWidgetState extends State<PowerpointsWidget> {
  late PowerpointsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PowerpointsModel());

    if (!isWeb) {
      _keyboardVisibilitySubscription =
          KeyboardVisibilityController().onChange.listen((bool visible) {
        safeSetState(() {
          _isKeyboardVisible = visible;
        });
      });
    }
  }

  @override
  void dispose() {
    _model.dispose();

    if (!isWeb) {
      _keyboardVisibilitySubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: const Color(0xFF9DCFC2),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'x2g73iuz' /* Powerpoints */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey(
                      FlutterFlowTheme.of(context).headlineMediumFamily),
                ),
          ),
          actions: const [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                      child: Container(
                        width: double.infinity,
                        height: 44.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    15.0, 2.0, 0.0, 2.0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  icon: Icon(
                                    Icons.home_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    size: 22.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('HomePage');
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: Icon(
                                  Icons.chevron_right_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 16.0,
                                ),
                              ),
                              Container(
                                height: 100.0,
                                decoration: const BoxDecoration(),
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 5.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'tglu18pp' /* Fagfolk */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Readex Pro'),
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    5.0, 0.0, 5.0, 0.0),
                                child: Icon(
                                  Icons.chevron_right_rounded,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 16.0,
                                ),
                              ),
                              Container(
                                height: 100.0,
                                decoration: const BoxDecoration(),
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 0.0, 5.0, 0.0),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'x1ocohjg' /* MANU 0-9 mnd */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          fontFamily: 'Readex Pro',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey('Readex Pro'),
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 50.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'n03tfqol' /* Powerpoints (Kalaallisut) */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 25.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'assets/images/1-undervisning-0-9.png',
                                  width: 300.0,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'g1zdkoch' /* 1 Ilinniartitsineq Meeraq naar... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await downloadFile(
                                      filename:
                                          '1-Ilinniartitsineq_Meeraq-naartuneq-angajoqqaajunerlu.pptx',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F0-9%20mdr%2FPowerpoints%20(Kalaallisut)%2FPowerpoints%2F1-Ilinniartitsineq_Meeraq-naartuneq-angajoqqaajunerlu.pptx?alt=media&token=e240b064-b2e9-470c-b4ea-2e4b8d80f690',
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '5kbbvpl9' /* Hent Powerpoint */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 320.0,
                                    height: 50.0,
                                    padding: const EdgeInsets.all(0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF9DCFC2),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 25.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'assets/images/2-0-9.png',
                                  width: 300.0,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'rgab7ue7' /* 2 Ilinniartitsineq Meeraq naar... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await downloadFile(
                                      filename:
                                          '2-Ilinniartitsineq_Meeraq-naartuneq-angajoqqaajunerlu.pptx',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F0-9%20mdr%2FPowerpoints%20(Kalaallisut)%2FPowerpoints%2F2-Ilinniartitsineq_Meeraq-naartuneq-angajoqqaajunerlu.pptx?alt=media&token=8d4d3a86-06fb-4448-b355-37ec71e464d8',
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'fpnl5pzn' /* Hent Powerpoint */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 320.0,
                                    height: 50.0,
                                    padding: const EdgeInsets.all(0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF9DCFC2),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 25.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'assets/images/3-0-9.png',
                                  width: 300.0,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'kkporxui' /* 3 Ilinniartitsineq Meeraq naar... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await downloadFile(
                                      filename:
                                          '3-Ilinniartitsineq_Meeraq-naartuneq-angajoqqaajunerlu.pptx',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F0-9%20mdr%2FPowerpoints%20(Kalaallisut)%2FPowerpoints%2F3-Ilinniartitsineq_Meeraq-naartuneq-angajoqqaajunerlu.pptx?alt=media&token=e6b4d846-5b2e-453b-97f3-23e8bb83d4a2',
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '46byp7l6' /* Hent Powerpoint */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 320.0,
                                    height: 50.0,
                                    padding: const EdgeInsets.all(0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF9DCFC2),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 25.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'assets/images/4-0-9.png',
                                  width: 300.0,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'lthq60di' /* 4 Ilinniartitsineq Meeraq naar... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await downloadFile(
                                      filename:
                                          '4-Ilinniartitsineq_Meeraq-naartuneq-angajoqqaajunerlu.pptx',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F0-9%20mdr%2FPowerpoints%20(Kalaallisut)%2FPowerpoints%2F4-Ilinniartitsineq_Meeraq-naartuneq-angajoqqaajunerlu.pptx?alt=media&token=088990e4-79e5-49e8-8fc3-43b04a18348b',
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'kvttco4y' /* Hent Powerpoint */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 320.0,
                                    height: 50.0,
                                    padding: const EdgeInsets.all(0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF9DCFC2),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 25.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'assets/images/5-0-9.png',
                                  width: 300.0,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '3n2qkzzr' /* 5 Ilinniartitsineq Meeraq naar... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await downloadFile(
                                      filename:
                                          '5-Ilinniartitsineq_Meeraq-naartuneq-angajoqqaajunerlu.pptx',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F0-9%20mdr%2FPowerpoints%20(Kalaallisut)%2FPowerpoints%2F5-Ilinniartitsineq_Meeraq-naartuneq-angajoqqaajunerlu.pptx?alt=media&token=2686b9b8-8c53-497a-88fe-b9be5980f849',
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '52akb4ct' /* Hent Powerpoint */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 320.0,
                                    height: 50.0,
                                    padding: const EdgeInsets.all(0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF9DCFC2),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 25.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'assets/images/5-0-9.png',
                                  width: 300.0,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'nnqwj4m9' /* 6 Ilinniartitsineq Meeraq naar... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await downloadFile(
                                      filename:
                                          '6-Ilinniartitsineq_Meeraq-naartuneq-angajoqqaajunerlu.pptx',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F0-9%20mdr%2FPowerpoints%20(Kalaallisut)%2FPowerpoints%2F6-Ilinniartitsineq_Meeraq-naartuneq-angajoqqaajunerlu.pptx?alt=media&token=6f1b1db4-8fce-4c03-afec-79635957797a',
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'jt7i0w6a' /* Hent Powerpoint */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 320.0,
                                    height: 50.0,
                                    padding: const EdgeInsets.all(0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF9DCFC2),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 25.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'assets/images/7-.png',
                                  width: 300.0,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'c38cs5xu' /* 7 Ilinniartitsineq Meeraq naar... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await downloadFile(
                                      filename:
                                          '7-Ilinniartitsineq_Meeraq-naartuneq-angajoqqaajunerlu.pptx',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F0-9%20mdr%2FPowerpoints%20(Kalaallisut)%2FPowerpoints%2F7-Ilinniartitsineq_Meeraq-naartuneq-angajoqqaajunerlu.pptx?alt=media&token=4c1c2046-2e81-4d60-a74e-b9f007891371',
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'fub6cah6' /* Hent Powerpoint */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 320.0,
                                    height: 50.0,
                                    padding: const EdgeInsets.all(0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF9DCFC2),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 25.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'assets/images/Capture.png',
                                  width: 300.0,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'k9ijsmop' /* 8 Ilinniartitsineq Meeraq naar... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await downloadFile(
                                      filename:
                                          '8-Ilinniartitsineq_Meeraq-naartuneq-angajoqqaajunerlu.pptx',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F0-9%20mdr%2FPowerpoints%20(Kalaallisut)%2FPowerpoints%2F8-Ilinniartitsineq_Meeraq-naartuneq-angajoqqaajunerlu.pptx?alt=media&token=b394571c-34aa-483b-b76d-996f52b0d5dc',
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'ufoes9bw' /* Hent Powerpoint */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 320.0,
                                    height: 50.0,
                                    padding: const EdgeInsets.all(0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF9DCFC2),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 50.0, 0.0, 25.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50.0),
                                    child: Image.asset(
                                      'assets/images/Capture.png',
                                      width: 300.0,
                                      fit: BoxFit.fill,
                                      alignment: const Alignment(0.0, 0.0),
                                    ),
                                  ),
                                ),
                                Text(
                                  FFLocalizations.of(context).getText(
                                    '6dnb1jvy' /* 9 Ilinniartitsineq Meeraq naar... */,
                                  ),
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        await downloadFile(
                                          filename:
                                              '9-Ilinniartitsineq_Meeraq-naartuneq-angajoqqaajunerlu.pptx',
                                          url:
                                              'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F0-9%20mdr%2FPowerpoints%20(Kalaallisut)%2FPowerpoints%2F9-Ilinniartitsineq_Meeraq-naartuneq-angajoqqaajunerlu.pptx?alt=media&token=4e0061de-9909-4659-a28b-8e932abd6b74',
                                        );
                                      },
                                      text: FFLocalizations.of(context).getText(
                                        'k4qixdkc' /* Hent Powerpoint */,
                                      ),
                                      options: FFButtonOptions(
                                        width: 320.0,
                                        height: 50.0,
                                        padding: const EdgeInsets.all(0.0),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: const Color(0xFF9DCFC2),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color: Colors.white,
                                              fontSize: 25.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmallFamily),
                                            ),
                                        elevation: 3.0,
                                        borderSide: const BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 50.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'm5yw5b1q' /* Powerpoints (Dansk) */,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 25.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'assets/images/1d09.png',
                                  width: 300.0,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '0m41n8xz' /* 1 Til undervisning forældrefor... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await downloadFile(
                                      filename:
                                          '1-Til-undervisning_Foraeldreforbereldelse-0-9-maneder.pptx',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F0-9%20mdr%2FPowerpoints%20(Dansk)%2FPowerpoints%2F1-Til-undervisning_Foraeldreforbereldelse-0-9-maneder.pptx?alt=media&token=79732068-cd89-485d-98ed-2ee870644e43',
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    's4ielgdr' /* Hent Powerpoint */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 320.0,
                                    height: 50.0,
                                    padding: const EdgeInsets.all(0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF9DCFC2),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 25.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'assets/images/1d09.png',
                                  width: 300.0,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '9tjoz2ov' /* 2 Til undervisning forældrefor... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await downloadFile(
                                      filename:
                                          '2-Til-undervisning_Foraeldreforbereldelse-0-9-maneder.pptx',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F0-9%20mdr%2FPowerpoints%20(Dansk)%2FPowerpoints%2F2-Til-undervisning_Foraeldreforbereldelse-0-9-maneder.pptx?alt=media&token=96aa55a7-ed1f-4db5-96ce-0b40011f6e3a',
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '2fn2skmi' /* Hent Powerpoint */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 320.0,
                                    height: 50.0,
                                    padding: const EdgeInsets.all(0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF9DCFC2),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 25.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'assets/images/3d09.png',
                                  width: 300.0,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                's95duj7i' /* 3 Til undervisning forældrefor... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await downloadFile(
                                      filename:
                                          '3-Til-undervisning_Foraeldreforbereldelse-0-9-maneder.pptx',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F0-9%20mdr%2FPowerpoints%20(Dansk)%2FPowerpoints%2F3-Til-undervisning_Foraeldreforbereldelse-0-9-maneder.pptx?alt=media&token=92279758-9671-4f61-aeff-893e169c7809',
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    '2h95h2rw' /* Hent Powerpoint */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 320.0,
                                    height: 50.0,
                                    padding: const EdgeInsets.all(0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF9DCFC2),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 25.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'assets/images/3d09.png',
                                  width: 300.0,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'wz8eo43b' /* 4 Til undervisning forældrefor... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await downloadFile(
                                      filename:
                                          '4-Til-undervisning_Foraeldreforbereldelse-0-9-maneder.pptx',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F0-9%20mdr%2FPowerpoints%20(Dansk)%2FPowerpoints%2F4-Til-undervisning_Foraeldreforbereldelse-0-9-maneder.pptx?alt=media&token=00b2b095-3124-46c6-9ff8-1a428f8ebce5',
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'f0arwkds' /* Hent Powerpoint */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 320.0,
                                    height: 50.0,
                                    padding: const EdgeInsets.all(0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF9DCFC2),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 25.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'assets/images/5d09.png',
                                  width: 300.0,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'qos6his9' /* 5 Til undervisning forældrefor... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await downloadFile(
                                      filename:
                                          '5-Til-undervisning_Foraeldreforbereldelse-0-9-maneder.pptx',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F0-9%20mdr%2FPowerpoints%20(Dansk)%2FPowerpoints%2F5-Til-undervisning_Foraeldreforbereldelse-0-9-maneder.pptx?alt=media&token=f62ff59c-6a5d-4665-96af-b55977cdad19',
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'ic0r5sip' /* Hent Powerpoint */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 320.0,
                                    height: 50.0,
                                    padding: const EdgeInsets.all(0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF9DCFC2),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 25.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'assets/images/6d09.png',
                                  width: 300.0,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'g45djwya' /* 6 Til undervisning forældrefor... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await downloadFile(
                                      filename:
                                          '6-Til-undervisning_Foraeldreforbereldelse-0-9-maneder.pptx',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F0-9%20mdr%2FPowerpoints%20(Dansk)%2FPowerpoints%2F6-Til-undervisning_Foraeldreforbereldelse-0-9-maneder.pptx?alt=media&token=0e0b35c5-030b-4363-b174-edfba201c5b3',
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'xyucda7y' /* Hent Powerpoint */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 320.0,
                                    height: 50.0,
                                    padding: const EdgeInsets.all(0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF9DCFC2),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 25.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'assets/images/7d09.png',
                                  width: 300.0,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'geo60eew' /* 7 Til undervisning forældrefor... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await downloadFile(
                                      filename:
                                          '7-Til-undervisning_Foraeldreforbereldelse-0-9-maneder.pptx',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F0-9%20mdr%2FPowerpoints%20(Dansk)%2FPowerpoints%2F7-Til-undervisning_Foraeldreforbereldelse-0-9-maneder.pptx?alt=media&token=e175cd0d-16da-47d0-8d5a-d3eb000458c6',
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'ttbxx3oc' /* Hent Powerpoint */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 320.0,
                                    height: 50.0,
                                    padding: const EdgeInsets.all(0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF9DCFC2),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 25.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'assets/images/8d09.png',
                                  width: 300.0,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                '4x90jb8t' /* 8 Til undervisning forældrefor... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await downloadFile(
                                      filename:
                                          '8-Til-undervisning_Foraeldreforbereldelse-0-9-maneder.pptx',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F0-9%20mdr%2FPowerpoints%20(Dansk)%2FPowerpoints%2F8-Til-undervisning_Foraeldreforbereldelse-0-9-maneder.pptx?alt=media&token=5ef0ce18-9f23-460a-a397-c76c28868a57',
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'z4auf509' /* Hent Powerpoint */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 320.0,
                                    height: 50.0,
                                    padding: const EdgeInsets.all(0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF9DCFC2),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 50.0, 0.0, 25.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.0),
                                child: Image.asset(
                                  'assets/images/7d09.png',
                                  width: 300.0,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                            Text(
                              FFLocalizations.of(context).getText(
                                'v6dmmqcx' /* 9 Til undervisning forældrefor... */,
                              ),
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 18.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await downloadFile(
                                      filename:
                                          '9-Til-undervisning_Foraeldreforbereldelse-0-9-maneder.pptx',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F0-9%20mdr%2FPowerpoints%20(Dansk)%2FPowerpoints%2F9-Til-undervisning_Foraeldreforbereldelse-0-9-maneder.pptx?alt=media&token=81143d24-1cec-43ec-8421-92a187ba090e',
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'pge10el4' /* Hent Powerpoint */,
                                  ),
                                  options: FFButtonOptions(
                                    width: 320.0,
                                    height: 50.0,
                                    padding: const EdgeInsets.all(0.0),
                                    iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: const Color(0xFF9DCFC2),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
                                        ),
                                    elevation: 3.0,
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ].addToEnd(const SizedBox(height: 100.0)),
                ),
              ),
              if (!(isWeb
                  ? MediaQuery.viewInsetsOf(context).bottom > 0
                  : _isKeyboardVisible))
                Align(
                  alignment: const AlignmentDirectional(0.0, 1.0),
                  child: wrapWithModel(
                    model: _model.bottomNavigationModel,
                    updateCallback: () => safeSetState(() {}),
                    child: const BottomNavigationWidget(
                      selectedPageIndex: 2,
                      hidden: false,
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
