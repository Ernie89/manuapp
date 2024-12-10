import '/backend/backend.dart';
import '/components/bottom_navigation/bottom_navigation_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'nyheder_model.dart';
export 'nyheder_model.dart';

class NyhederWidget extends StatefulWidget {
  const NyhederWidget({super.key});

  @override
  State<NyhederWidget> createState() => _NyhederWidgetState();
}

class _NyhederWidgetState extends State<NyhederWidget> {
  late NyhederModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  late StreamSubscription<bool> _keyboardVisibilitySubscription;
  bool _isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NyhederModel());

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
        appBar: AppBar(
          backgroundColor: const Color(0xFF9DCFC2),
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Text(
              FFLocalizations.of(context).getText(
                'zlx3e4uu' /* NYHEDER */,
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
          ),
          actions: const [],
          centerTitle: false,
          elevation: 1.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: const AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          25.0, 25.0, 25.0, 25.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        child: Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.0),
                                  child: StreamBuilder<List<NyhederRecord>>(
                                    stream: queryNyhederRecord(),
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
                                      List<NyhederRecord>
                                          listViewNyhederRecordList =
                                          snapshot.data!;

                                      return ListView.builder(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        itemCount:
                                            listViewNyhederRecordList.length,
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewNyhederRecord =
                                              listViewNyhederRecordList[
                                                  listViewIndex];
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.network(
                                                  listViewNyhederRecord.billede,
                                                  width: 300.0,
                                                  height: 200.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              FlutterFlowVideoPlayer(
                                                path:
                                                    listViewNyhederRecord.video,
                                                videoType: VideoType.network,
                                                width: 300.0,
                                                autoPlay: false,
                                                looping: true,
                                                showControls: true,
                                                allowFullScreen: true,
                                                allowPlaybackSpeedMenu: false,
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 25.0, 0.0, 25.0),
                                                child: Text(
                                                  listViewNyhederRecord.titel,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .headlineLarge
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineLargeFamily,
                                                        fontSize: 25.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineLargeFamily),
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 25.0),
                                                child: Text(
                                                  listViewNyhederRecord.indhold,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
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
                                            ],
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ].addToEnd(const SizedBox(height: 100.0)),
                            ),
                          ),
                        ),
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
            ],
          ),
        ),
      ),
    );
  }
}
