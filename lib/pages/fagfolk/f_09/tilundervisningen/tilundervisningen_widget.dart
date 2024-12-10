import '/components/bottom_navigation/bottom_navigation_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_youtube_player.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tilundervisningen_model.dart';
export 'tilundervisningen_model.dart';

class TilundervisningenWidget extends StatefulWidget {
  const TilundervisningenWidget({super.key});

  @override
  State<TilundervisningenWidget> createState() =>
      _TilundervisningenWidgetState();
}

class _TilundervisningenWidgetState extends State<TilundervisningenWidget> {
  late TilundervisningenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TilundervisningenModel());

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
    return YoutubeFullScreenWrapper(
      child: GestureDetector(
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
                'ty5xwr4d' /* Til undervisningen */,
              ),
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily:
                        FlutterFlowTheme.of(context).headlineMediumFamily,
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
                                          '62tfuh3m' /* Fagfolk */,
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
                                          'cfe1syxw' /* MANU 0-9 mnd */,
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
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 25.0, 0.0, 50.0),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'd1l76z6k' /* MANU 0-9 måneder */,
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
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodyMediumFamily),
                                ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 50.0, 0.0, 50.0),
                                child: FlutterFlowYoutubePlayer(
                                  url:
                                      'https://www.youtube.com/watch?v=7aq0mrWb8c4',
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  height: double.infinity,
                                  autoPlay: false,
                                  looping: true,
                                  mute: false,
                                  showControls: true,
                                  showFullScreen: true,
                                  strictRelatedVideos: true,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 25.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'k4vjlz9q' /* MANU */,
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
                              Text(
                                FFLocalizations.of(context).getText(
                                  '4eeahl1a' /* Angaoqqaanngornissamut piareer... */,
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
                                            'MANU - Angaoqqaanngornissamut piareersarneq, forældreforberedelse.mp4',
                                        url:
                                            'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FMANU%20-%20Angaoqqaanngornissamut%20piareersarneq%2C%20for%C3%A6ldreforberedelse.mp4?alt=media&token=5fa5375f-f2f7-405b-9145-a980acc90aec',
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '6bkaap63' /* Hent Video */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 200.0,
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
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 50.0, 0.0, 50.0),
                                child: FlutterFlowYoutubePlayer(
                                  url:
                                      'https://www.youtube.com/watch?v=tKTIdBUUmYI',
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  height: double.infinity,
                                  autoPlay: false,
                                  looping: true,
                                  mute: false,
                                  showControls: true,
                                  showFullScreen: true,
                                  strictRelatedVideos: true,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 25.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'jxcnpjta' /* MANU */,
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
                              Text(
                                FFLocalizations.of(context).getText(
                                  'k3fopprx' /* Pilluarit, Angajoqqaanngulerpu... */,
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
                                            'MANU - Pilluarit, Angajoqqaanngulerputit, Tillykke du skal være forælder.mp4',
                                        url:
                                            'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FMANU%20-%20Pilluarit%2C%20Angajoqqaanngulerputit%2C%20Tillykke%20du%20skal%20v%C3%A6re%20for%C3%A6lder.mp4?alt=media&token=9aed461e-b3ed-41da-bd0a-0824e088a0b9',
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '7agqlvy2' /* Hent Video */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 200.0,
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
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 50.0, 0.0, 50.0),
                                child: FlutterFlowYoutubePlayer(
                                  url:
                                      'https://www.youtube.com/watch?v=xAOqtoJf_Vk',
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  height: double.infinity,
                                  autoPlay: false,
                                  looping: true,
                                  mute: false,
                                  showControls: true,
                                  showFullScreen: true,
                                  strictRelatedVideos: true,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 25.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'lmvunpxs' /* MANU */,
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
                              Text(
                                FFLocalizations.of(context).getText(
                                  '02x86j72' /* Angajoqqaanngornissamut piaree... */,
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
                                            'MANU - Angajoqqaanngornissamut piareersarneq, Forældreforberedelse.mp4',
                                        url:
                                            'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FMANU%20-%20Angajoqqaanngornissamut%20piareersarneq%2C%20For%C3%A6ldreforberedelse.mp4?alt=media&token=b10416b9-8b14-4e09-8703-57a52f78d069',
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'vgg9pyb0' /* Hent Video */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 200.0,
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
                        Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 50.0, 0.0, 50.0),
                                child: FlutterFlowYoutubePlayer(
                                  url:
                                      'https://www.youtube.com/watch?v=Z3prGmzdJ1Y',
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  height: double.infinity,
                                  autoPlay: false,
                                  looping: true,
                                  mute: false,
                                  showControls: true,
                                  showFullScreen: true,
                                  strictRelatedVideos: true,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 25.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'vk0ilprn' /* MANU */,
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
                              Text(
                                FFLocalizations.of(context).getText(
                                  'lfxjwj3w' /* Angajoqqanngornissamut piareer... */,
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
                                            'MANU - Angajoqqanngornissamut piareersarneq, forældreforberedelse.mp4',
                                        url:
                                            'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FMANU%20-%20Angajoqqanngornissamut%20piareersarneq%2C%20for%C3%A6ldreforberedelse.mp4?alt=media&token=370a4635-e8a4-46b8-a3c3-9a8273a4425b',
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'a6n7ojm8' /* Hent Video */,
                                    ),
                                    options: FFButtonOptions(
                                      width: 200.0,
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
    );
  }
}
