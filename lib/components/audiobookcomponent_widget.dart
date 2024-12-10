import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'audiobookcomponent_model.dart';
export 'audiobookcomponent_model.dart';

class AudiobookcomponentWidget extends StatefulWidget {
  /// I want to make audio player where it have: Image cover, audio file, play
  /// icon and an download button. Download button shall be using download file
  /// function where i can define file url for each sound file.
  const AudiobookcomponentWidget({
    super.key,
    this.audibookTitle,
  });

  final String? audibookTitle;

  @override
  State<AudiobookcomponentWidget> createState() =>
      _AudiobookcomponentWidgetState();
}

class _AudiobookcomponentWidgetState extends State<AudiobookcomponentWidget> {
  late AudiobookcomponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AudiobookcomponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).alternate,
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://images.unsplash.com/photo-1615196153909-32e0d4a7e662?w=500&h=500',
                  width: double.infinity,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'gj0hsq7y' /* Track Title Here */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .titleMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .titleMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .titleMediumFamily),
                              ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'yfrquqrp' /* Artist Name */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ],
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 23.0,
                    buttonSize: 46.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.download_rounded,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ].divide(const SizedBox(width: 8.0)),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterFlowIconButton(
                    borderRadius: 23.0,
                    buttonSize: 46.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.skip_previous_rounded,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 30.0,
                    buttonSize: 60.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.play_arrow_rounded,
                      color: FlutterFlowTheme.of(context).info,
                      size: 32.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 23.0,
                    buttonSize: 46.0,
                    fillColor: FlutterFlowTheme.of(context).primary,
                    icon: Icon(
                      Icons.skip_next_rounded,
                      color: FlutterFlowTheme.of(context).info,
                      size: 24.0,
                    ),
                    onPressed: () {
                      print('IconButton pressed ...');
                    },
                  ),
                ].divide(const SizedBox(width: 16.0)),
              ),
              SizedBox(
                width: double.infinity,
                child: Slider(
                  activeColor: FlutterFlowTheme.of(context).primary,
                  inactiveColor: const Color(0x33000000),
                  min: 0.0,
                  max: 100.0,
                  value: _model.sliderValue ??= 30.0,
                  onChanged: (newValue) {
                    newValue = double.parse(newValue.toStringAsFixed(4));
                    safeSetState(() => _model.sliderValue = newValue);
                  },
                ),
              ),
            ].divide(const SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
