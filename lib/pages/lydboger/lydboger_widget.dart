import '/backend/backend.dart';
import '/components/bottom_navigation/bottom_navigation_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'lydboger_model.dart';
export 'lydboger_model.dart';

class LydbogerWidget extends StatefulWidget {
  const LydbogerWidget({super.key});

  @override
  State<LydbogerWidget> createState() => _LydbogerWidgetState();
}

class _LydbogerWidgetState extends State<LydbogerWidget> {
  late LydbogerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LydbogerModel());

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
              context.pushNamed('HomePage');
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'w8j4tb8d' /* Lydbøger */,
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  useGoogleFonts: GoogleFonts.asMap().containsKey('Outfit'),
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
              Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                        'e0mom9th' /* Lydbøger */,
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
                            0.0, 25.0, 0.0, 25.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '8j7np8rk' /* KALAALLISUT */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineLargeFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineLargeFamily),
                              ),
                        ),
                      ),
                      StreamBuilder<List<AudioBooksRecord>>(
                        stream: queryAudioBooksRecord(
                          queryBuilder: (audioBooksRecord) =>
                              audioBooksRecord.where(
                            'Sprog',
                            isEqualTo: 'GL',
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return const Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitDoubleBounce(
                                  color: Color(0xFF9DCFC2),
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<AudioBooksRecord> listViewAudioBooksRecordList =
                              snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewAudioBooksRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewAudioBooksRecord =
                                  listViewAudioBooksRecordList[listViewIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 25.0, 0.0, 25.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            listViewAudioBooksRecord.imageCover,
                                            width: 275.0,
                                            height: 275.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          35.0, 25.0, 35.0, 25.0),
                                      child: FlutterFlowAudioPlayer(
                                        audio: Audio.network(
                                          listViewAudioBooksRecord.audioFile,
                                          metas: Metas(
                                            title: listViewAudioBooksRecord
                                                .audiobookTitle,
                                          ),
                                        ),
                                        titleTextStyle: FlutterFlowTheme.of(
                                                context)
                                            .titleLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeFamily),
                                            ),
                                        playbackDurationTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        playbackButtonColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        elevation: 0.0,
                                        playInBackground: PlayInBackground
                                            .disabledRestoreOnForeground,
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(25.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await downloadFile(
                                              filename: listViewAudioBooksRecord
                                                  .fileName,
                                              url: listViewAudioBooksRecord
                                                  .downloadURL,
                                            );

                                            await DowloadedFilesRecord
                                                .collection
                                                .doc(formatNumber(
                                                  listViewIndex,
                                                  formatType:
                                                      FormatType.decimal,
                                                  decimalType:
                                                      DecimalType.commaDecimal,
                                                ))
                                                .set(
                                                    createDowloadedFilesRecordData(
                                                  fileName:
                                                      listViewAudioBooksRecord
                                                          .audiobookTitle,
                                                  fileType: 'mp3',
                                                  soundFile:
                                                      listViewAudioBooksRecord
                                                          .audioFile,
                                                ));
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '7yb5r9yl' /* Hent lydbog */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 190.0,
                                            height: 40.0,
                                            padding: const EdgeInsets.all(0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: const Color(0xFF9DCFC2),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                              );
                            },
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 25.0, 0.0, 25.0),
                        child: Text(
                          FFLocalizations.of(context).getText(
                            'du7jf1mg' /* DANSK */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineLargeFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineLargeFamily),
                              ),
                        ),
                      ),
                      StreamBuilder<List<AudioBooksRecord>>(
                        stream: queryAudioBooksRecord(
                          queryBuilder: (audioBooksRecord) =>
                              audioBooksRecord.where(
                            'Sprog',
                            isEqualTo: 'DK',
                          ),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return const Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: SpinKitDoubleBounce(
                                  color: Color(0xFF9DCFC2),
                                  size: 50.0,
                                ),
                              ),
                            );
                          }
                          List<AudioBooksRecord> listViewAudioBooksRecordList =
                              snapshot.data!;

                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewAudioBooksRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewAudioBooksRecord =
                                  listViewAudioBooksRecordList[listViewIndex];
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 25.0, 0.0, 25.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            15.0, 0.0, 15.0, 0.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.network(
                                            listViewAudioBooksRecord.imageCover,
                                            width: 275.0,
                                            height: 275.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          0.0, 25.0, 0.0, 25.0),
                                      child: FlutterFlowAudioPlayer(
                                        audio: Audio.network(
                                          listViewAudioBooksRecord.audioFile,
                                          metas: Metas(
                                            title: listViewAudioBooksRecord
                                                .audiobookTitle,
                                          ),
                                        ),
                                        titleTextStyle: FlutterFlowTheme.of(
                                                context)
                                            .titleLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleLargeFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleLargeFamily),
                                            ),
                                        playbackDurationTextStyle:
                                            FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  fontFamily:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMediumFamily,
                                                  letterSpacing: 0.0,
                                                  useGoogleFonts: GoogleFonts
                                                          .asMap()
                                                      .containsKey(
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelMediumFamily),
                                                ),
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        playbackButtonColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        activeTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        inactiveTrackColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        elevation: 0.0,
                                        playInBackground: PlayInBackground
                                            .disabledRestoreOnForeground,
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: const EdgeInsets.all(25.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await downloadFile(
                                              filename: listViewAudioBooksRecord
                                                  .fileName,
                                              url: listViewAudioBooksRecord
                                                  .downloadURL,
                                            );
                                          },
                                          text: FFLocalizations.of(context)
                                              .getText(
                                            '5u8id5h3' /* Hent lydbog */,
                                          ),
                                          options: FFButtonOptions(
                                            width: 190.0,
                                            height: 40.0,
                                            padding: const EdgeInsets.all(0.0),
                                            iconPadding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: const Color(0xFF9DCFC2),
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                              );
                            },
                          );
                        },
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
                      selectedPageIndex: 1,
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
