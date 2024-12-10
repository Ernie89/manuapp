import '/components/bottom_navigation/bottom_navigation_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'f56_materialer_model.dart';
export 'f56_materialer_model.dart';

class F56MaterialerWidget extends StatefulWidget {
  const F56MaterialerWidget({super.key});

  @override
  State<F56MaterialerWidget> createState() => _F56MaterialerWidgetState();
}

class _F56MaterialerWidgetState extends State<F56MaterialerWidget> {
  late F56MaterialerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => F56MaterialerModel());

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
              '42uhnaap' /* Materialer */,
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
              Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: SingleChildScrollView(
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
                                        'bor3jq71' /* Fagfolk */,
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
                                        'v40hw7tu' /* MANU 5-6 år */,
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 50.0, 0.0, 25.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(
                            'assets/images/19128_MANU_Samtaleark_5-6aar_04.jpg',
                            width: 300.0,
                            fit: BoxFit.fill,
                            alignment: const Alignment(0.0, 0.0),
                          ),
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'txwhib6y' /* MANU samtaleark 5-6 år */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
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
                                    '19128_MANU_Samtaleark_5-6aar_04-compressed.pdf',
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F5-6%20%C3%A5r%2FMaterialer%2F19128_MANU_Samtaleark_5-6aar_04-compressed.pdf?alt=media&token=b70d93f3-c959-496b-a97e-8dac70f3e858',
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              '9mnc29h5' /* Download PDF */,
                            ),
                            options: FFButtonOptions(
                              width: 235.0,
                              height: 50.0,
                              padding: const EdgeInsets.all(0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFF9DCFC2),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
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
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 50.0, 0.0, 25.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(
                            'assets/images/17888_MANU_Samtalevejledning_5-6aar_04.jpg',
                            width: 300.0,
                            fit: BoxFit.fill,
                            alignment: const Alignment(0.0, 0.0),
                          ),
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'cyf2er68' /* Samtalevejledning 5-6 år */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
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
                                    '17888_MANU_Samtalevejledning_5-6aar_04-compressed.pdf',
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F5-6%20%C3%A5r%2FMaterialer%2F17888_MANU_Samtalevejledning_5-6aar_04-compressed.pdf?alt=media&token=2e3472c5-a4f2-48da-8040-807c7c90df28',
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              'n3q4zpub' /* Download PDF */,
                            ),
                            options: FFButtonOptions(
                              width: 230.0,
                              height: 50.0,
                              padding: const EdgeInsets.all(0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFF9DCFC2),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
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
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 50.0, 0.0, 25.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(
                            'assets/images/MANU_Almen-vejledning_5-6aar-Final.png',
                            width: 300.0,
                            fit: BoxFit.fill,
                            alignment: const Alignment(0.0, 0.0),
                          ),
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'h9c3i25o' /* Vejledning til ledere og pædag... */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
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
                                    'MANU_Almen-vejledning_5-6aar-Final-compressed.pdf',
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F5-6%20%C3%A5r%2FMaterialer%2FMANU_Almen-vejledning_5-6aar-Final-compressed.pdf?alt=media&token=6ed8e14d-314f-4ed2-ab72-8a3be1b7419c',
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              'vkwy4f7d' /* Download PDF */,
                            ),
                            options: FFButtonOptions(
                              width: 230.0,
                              height: 50.0,
                              padding: const EdgeInsets.all(0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFF9DCFC2),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
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
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 50.0, 0.0, 25.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(
                            'assets/images/5-6-plakat.jpg',
                            width: 300.0,
                            fit: BoxFit.fill,
                            alignment: const Alignment(0.0, 0.0),
                          ),
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          'qllxm34o' /* MANU 5-6 år Plakat */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
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
                                filename: 'MANU-5-6-ar-Plakat-compressed.pdf',
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F5-6%20%C3%A5r%2FMaterialer%2FMANU-5-6-ar-Plakat-compressed.pdf?alt=media&token=4af27f14-e0fe-4ccf-9ffa-e2eddec35a28',
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              '3kv5iytb' /* Download PDF */,
                            ),
                            options: FFButtonOptions(
                              width: 230.0,
                              height: 50.0,
                              padding: const EdgeInsets.all(0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFF9DCFC2),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
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
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 50.0, 0.0, 25.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(
                            'assets/images/MANU-regler-til-spil-5-6-ar.jpg',
                            width: 300.0,
                            fit: BoxFit.fill,
                            alignment: const Alignment(0.0, 0.0),
                          ),
                        ),
                      ),
                      Text(
                        FFLocalizations.of(context).getText(
                          '1n57io9h' /* MANU spilleregler 5-6 år */,
                        ),
                        textAlign: TextAlign.center,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              fontSize: 18.0,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
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
                                    'MANU-regler-til-spil-5-6-ar-compressed.pdf',
                                url:
                                    'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2F5-6%20%C3%A5r%2FMaterialer%2FMANU-regler-til-spil-5-6-ar-compressed.pdf?alt=media&token=df1b8476-b354-42b8-adfa-90252d6ef60c',
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              'xjvau9sw' /* Download PDF */,
                            ),
                            options: FFButtonOptions(
                              width: 230.0,
                              height: 50.0,
                              padding: const EdgeInsets.all(0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: const Color(0xFF9DCFC2),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
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
                    ].addToEnd(const SizedBox(height: 100.0)),
                  ),
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
