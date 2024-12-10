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
import 'f34_tilundervisningen_model.dart';
export 'f34_tilundervisningen_model.dart';

class F34TilundervisningenWidget extends StatefulWidget {
  const F34TilundervisningenWidget({super.key});

  @override
  State<F34TilundervisningenWidget> createState() =>
      _F34TilundervisningenWidgetState();
}

class _F34TilundervisningenWidgetState
    extends State<F34TilundervisningenWidget> {
  late F34TilundervisningenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => F34TilundervisningenModel());

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
                'j41r1r2z' /* Til undervisningen */,
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
                                          'x0t8v2eo' /* Fagfolk */,
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
                                          'jyupqwz3' /* MANU 3-4 år */,
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
                              '71cphewl' /* MANU 3-4 år */,
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
                                  url: 'https://youtu.be/zcZIBPp0f5E',
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  height: 200.0,
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
                                    'gfr3us9l' /* MANU */,
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
                                  'xlo1bu5x' /* Meeraq 3-nik aamma 4-nik ukiul... */,
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
                                            'MANU - Meeraq 3-nik aamma 4-nik ukiulik, barnet på 3 og 4 år.mp4',
                                        url:
                                            'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FMANU%20-%20Meeraq%203-nik%20aamma%204-nik%20ukiulik%2C%20barnet%20p%C3%A5%203%20og%204%20%C3%A5r.mp4?alt=media&token=6c2ae11b-a194-4a51-9658-75f837b0be36',
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'g8qs0bc1' /* Hent Video */,
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
                                  url: 'https://youtu.be/H4phIofsj8w',
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  height: 200.0,
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
                                    'km1s0zem' /* MANU */,
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
                                  'r3le0idd' /* Meeraq 3-nik aamma 4-nik ukiul... */,
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
                                            'Meeraq 3-nik aamma 4-nik ukiulik, barnet på 3 og 4 år.mp4',
                                        url:
                                            'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FMANU%20-%20Meeraq%203-nik%20aamma%204-nik%20ukiulik%2C%20barnet%20p%C3%A5%203%20og%204%20%C3%A5r%20(1).mp4?alt=media&token=a2308258-ed1b-4b64-8a04-168a15f7f6f0',
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '811e27fq' /* Hent Video */,
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
                                  url: 'https://youtu.be/FndZPKkMuP4',
                                  width: MediaQuery.sizeOf(context).width * 0.9,
                                  height: 200.0,
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
                                    '9x4xo9jz' /* MANU */,
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
                                  'x1y2w11j' /* Meeraq 3-nik aamma 4-nik ukiul... */,
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
                                            'Meeraq 3-nik aamma 4-nik ukiulik, barnet på 3 og 4 år.mp4',
                                        url:
                                            'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FMANU%20-%20Meeraq%203-nik%20aamma%204-nik%20ukiulik%2C%20barnet%20p%C3%A5%203%20og%204%20%C3%A5r%20(2).mp4?alt=media&token=edbcd14b-540e-44e5-887f-ec906e234379',
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'ln779a8j' /* Hent Video */,
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
                                  url: 'https://youtu.be/67-jlycYYdk',
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
                                    'kqv8klk3' /* MANU */,
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
                                  '7k64vke3' /* Meeraq 3-nik aamma 4-nik ukiul... */,
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
                                            'Meeraq 3-nik aamma 4-nik ukiulik, barnet på 3 og 4 år.mp4',
                                        url:
                                            'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FMANU%20-%20Meeraq%203-nik%20aamma%204-nik%20ukiulik%2C%20barnet%20p%C3%A5%203%20og%204%20%C3%A5r%20(3).mp4?alt=media&token=38c34c9e-b590-4d8b-8ead-4282535843c5',
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'r1kf8we3' /* Hent Video */,
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
                                  url: 'https://youtu.be/zHBLPfIW6v4',
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
                                    'sq4k7e6v' /* MANU */,
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
                                  'wlzc2z0n' /* (3-4 år) Animationsfilm - 
Go... */
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
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      await downloadFile(
                                        filename:
                                            '(3-4 år) Animationsfilm - Goddag og farvel.mp4',
                                        url:
                                            'https://firebasestorage.googleapis.com/v0/b/manu-projekt-rev2-v1sb4h.firebasestorage.app/o/Animationsvideoer%2FMANU%20(3-4%20%C3%A5r)%20Animationsfilm%20-%20Goddag%20og%20farvel%20(1).mp4?alt=media&token=e29ca65c-94c4-4b07-a993-b6ea11f7e7be',
                                      );
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      '0ho5txnp' /* Hent Video */,
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
