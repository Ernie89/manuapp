import '/components/bottom_navigation/bottom_navigation_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'f_foreldremodet_model.dart';
export 'f_foreldremodet_model.dart';

class FForeldremodetWidget extends StatefulWidget {
  const FForeldremodetWidget({super.key});

  @override
  State<FForeldremodetWidget> createState() => _FForeldremodetWidgetState();
}

class _FForeldremodetWidgetState extends State<FForeldremodetWidget> {
  late FForeldremodetModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FForeldremodetModel());

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
              'pho93uxv' /* MANU Forældremødet */,
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
                                        'wgp3ivfj' /* Fagfolk */,
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
                                        'p3acnnmq' /* MANU Forældremødet */,
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
                            25.0, 25.0, 25.0, 25.0),
                        child: SelectionArea(
                            child: Text(
                          FFLocalizations.of(context).getText(
                            'nfj0wj0p' /* MANU Forældremøde er et supple... */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 1.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                                lineHeight: 1.5,
                              ),
                        )),
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
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.asset(
                                              'assets/images/forldremde.jpg',
                                              width: 390.0,
                                              height: 200.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              FFLocalizations.of(context)
                                                  .getText(
                                                '4c6rhsot' /* Vidste du? */,
                                              ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    fontSize: 32.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts: GoogleFonts
                                                            .asMap()
                                                        .containsKey(
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily),
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(0.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 25.0, 0.0, 25.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.9,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                    FlutterFlowTheme.of(context)
                                                        .primary
                                                  ],
                                                  stops: const [0.0, 1.0],
                                                  begin: const AlignmentDirectional(
                                                      0.0, -1.0),
                                                  end: const AlignmentDirectional(
                                                      0, 1.0),
                                                ),
                                                borderRadius: const BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(25.0),
                                                  bottomRight:
                                                      Radius.circular(25.0),
                                                  topLeft:
                                                      Radius.circular(25.0),
                                                  topRight:
                                                      Radius.circular(25.0),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        25.0, 25.0, 25.0, 25.0),
                                                child: Text(
                                                  FFLocalizations.of(context)
                                                      .getText(
                                                    'vbp1rutu' /* Vidste du, at de fleste gravid... */,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily),
                                                      ),
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
                              Align(
                                alignment: const AlignmentDirectional(0.0, 1.0),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child:
                                      smooth_page_indicator.SmoothPageIndicator(
                                    controller: _model.pageViewController ??=
                                        PageController(initialPage: 0),
                                    count: 2,
                                    axisDirection: Axis.horizontal,
                                    onDotClicked: (i) async {
                                      await _model.pageViewController!
                                          .animateToPage(
                                        i,
                                        duration: const Duration(milliseconds: 500),
                                        curve: Curves.ease,
                                      );
                                      safeSetState(() {});
                                    },
                                    effect: smooth_page_indicator.SlideEffect(
                                      spacing: 8.0,
                                      radius: 8.0,
                                      dotWidth: 12.0,
                                      dotHeight: 12.0,
                                      dotColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
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
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 50.0, 0.0, 25.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Image.asset(
                            'assets/images/1-2.jpg',
                            width: 300.0,
                            height: 300.0,
                            fit: BoxFit.fill,
                            alignment: const Alignment(0.0, 0.0),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                'Boger_Til_Foraeldre',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 300),
                                  ),
                                },
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              '90us2mhu' /* Før undervisningen */,
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
                            'assets/images/3-4.jpg',
                            width: 300.0,
                            height: 300.0,
                            fit: BoxFit.fill,
                            alignment: const Alignment(0.0, 0.0),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                'Ekstra_materiale',
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: const TransitionInfo(
                                    hasTransition: true,
                                    transitionType:
                                        PageTransitionType.rightToLeft,
                                    duration: Duration(milliseconds: 300),
                                  ),
                                },
                              );
                            },
                            text: FFLocalizations.of(context).getText(
                              '3etmkfcm' /* Til undervisningen */,
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
                            'assets/images/Powerpoints1.jpg',
                            width: 300.0,
                            height: 300.0,
                            fit: BoxFit.fill,
                            alignment: const Alignment(0.0, 0.0),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              '45k0tqyg' /* Powerpoints */,
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
                            'assets/images/Powerpoints.jpg',
                            width: 300.0,
                            height: 300.0,
                            fit: BoxFit.fill,
                            alignment: const Alignment(0.0, 0.0),
                          ),
                        ),
                      ),
                      Align(
                        alignment: const AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text: FFLocalizations.of(context).getText(
                              '0slrkos3' /* Plakater, logo, post mm */,
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
