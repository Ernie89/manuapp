import '/components/bottom_navigation/bottom_navigation_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'f_foreldremodet_frundervisningen_model.dart';
export 'f_foreldremodet_frundervisningen_model.dart';

class FForeldremodetFrundervisningenWidget extends StatefulWidget {
  const FForeldremodetFrundervisningenWidget({super.key});

  @override
  State<FForeldremodetFrundervisningenWidget> createState() =>
      _FForeldremodetFrundervisningenWidgetState();
}

class _FForeldremodetFrundervisningenWidgetState
    extends State<FForeldremodetFrundervisningenWidget> {
  late FForeldremodetFrundervisningenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FForeldremodetFrundervisningenModel());

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
              'ggjn0izv' /* Før undervisningen */,
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
                                        'u8dboi74' /* Fagfolk */,
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
                                        '5llpuq7g' /* Forældremødet */,
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
                      Container(
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
                                  'assets/images/foraeldremode-0-2.jpg',
                                  width: 300.0,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 25.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'leapv5vr' /* MANU Forældremøde 0-2 år 
Vejl... */
                                  ,
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
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await downloadFile(
                                      filename:
                                          'Vejledning-til-Foraeldremode-0-2-ar-compressed.pdf',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2FFor%C3%A6ldrem%C3%B8det%2FF%C3%B8r%20undervisningen%2FVejledning-til-Foraeldremode-0-2-ar-compressed.pdf?alt=media&token=f2acaee3-6ff0-43eb-b200-17de436381ce',
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'rtiuiqdl' /* Download PDF */,
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
                      Container(
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
                                  'assets/images/foraeldre-mode-3.4.jpg',
                                  width: 300.0,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 25.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  'sk2wu3uv' /* MANU Forældremøde 
Vejledning,... */
                                  ,
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
                            ),
                            Align(
                              alignment: const AlignmentDirectional(0.0, 0.0),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    await downloadFile(
                                      filename:
                                          'Vejledning-til-Foraeldremode-3-4-ar-compressed.pdf',
                                      url:
                                          'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2FFor%C3%A6ldrem%C3%B8det%2FF%C3%B8r%20undervisningen%2FVejledning-til-Foraeldremode-3-4-ar-compressed.pdf?alt=media&token=a4172452-f782-4398-b37e-b3fd78f24f33',
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'p8dkxr62' /* Download PDF */,
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
                      Container(
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
                                  'assets/images/MANU_Almen-vejledning_5-6aar-Final_(1).png',
                                  width: 300.0,
                                  fit: BoxFit.fill,
                                  alignment: const Alignment(0.0, 0.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 25.0, 0.0, 25.0),
                              child: Text(
                                FFLocalizations.of(context).getText(
                                  '6wk7f1yo' /* Vejledning til ledere og pædag... */,
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
                                          'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FFagfolk%2FFor%C3%A6ldrem%C3%B8det%2FF%C3%B8r%20undervisningen%2FMANU_Almen-vejledning_5-6aar-Final-compressed.pdf?alt=media&token=7ee889d2-9e29-4176-80b6-5a0eb10c92aa',
                                    );
                                  },
                                  text: FFLocalizations.of(context).getText(
                                    'c6pz9xwi' /* Download PDF */,
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
