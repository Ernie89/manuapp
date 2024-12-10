import '/components/bottom_navigation/bottom_navigation_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'fagfolk_model.dart';
export 'fagfolk_model.dart';

class FagfolkWidget extends StatefulWidget {
  const FagfolkWidget({super.key});

  @override
  State<FagfolkWidget> createState() => _FagfolkWidgetState();
}

class _FagfolkWidgetState extends State<FagfolkWidget> {
  late FagfolkModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FagfolkModel());

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
              'weixtzxx' /* FAGFOLK */,
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
          child: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * 1.0,
              child: Stack(
                alignment: const AlignmentDirectional(0.0, 0.0),
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 12.0),
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
                                        12.0, 0.0, 12.0, 0.0),
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
                                          16.0, 0.0, 16.0, 0.0),
                                      child: Text(
                                        FFLocalizations.of(context).getText(
                                          '0ncji0in' /* Fagfolk */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.normal,
                                              useGoogleFonts:
                                                  GoogleFonts.asMap()
                                                      .containsKey(
                                                          'Readex Pro'),
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 16.0, 0.0),
                                    child: Container(
                                      height: 100.0,
                                      decoration: const BoxDecoration(),
                                      alignment: const AlignmentDirectional(0.0, 0.0),
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
                              'r99v8m60' /* MANU bygger på kompetenceudvik... */,
                            ),
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  letterSpacing: 1.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                  lineHeight: 1.5,
                                ),
                          )),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.8,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 50.0, 0.0, 25.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50.0),
                                  child: Image.asset(
                                    'assets/images/0-1.jpg',
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
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
                                        'F0-9',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 300),
                                          ),
                                        },
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '2qw31h4a' /* Manu 0-9 mdr. */,
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
                                    'assets/images/1-2.jpg',
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
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
                                      'is3qlpj6' /* Manu 1-2 år */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 245.0,
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
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
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
                                        'F3-4',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 300),
                                          ),
                                        },
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'ajmumzt1' /* Manu 3-4 år */,
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
                                    'assets/images/5-6.jpg',
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
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
                                        'F5-6',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 300),
                                          ),
                                        },
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '9rn08t7k' /* Manu 5-6 år */,
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
                                    'assets/images/Alkohol.jpg',
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
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
                                        'F-Alkohol',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 300),
                                          ),
                                        },
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '77yc693u' /* Manu Alkohol */,
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
                                    'assets/images/Foreldremodet.jpg',
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
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
                                        'F-Foreldremodet',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 300),
                                          ),
                                        },
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '0yka7x8f' /* Forældremødet */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 750.0,
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
                                    'assets/images/Hash.png',
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
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
                                        'F-Hash',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 300),
                                          ),
                                        },
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'nmohpb9n' /* Manu Hash */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 433.0,
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
                                    'assets/images/Instruktor.jpg',
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
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
                                        'F-Instruktr',
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: const TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 300),
                                          ),
                                        },
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '9su58rx7' /* Manu Instruktør */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 433.0,
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
        ),
      ),
    );
  }
}
