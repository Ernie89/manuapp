import '/backend/backend.dart';
import '/components/bottom_navigation/bottom_navigation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'animationsvideoer_widget.dart' show AnimationsvideoerWidget;
import 'package:flutter/material.dart';

class AnimationsvideoerModel extends FlutterFlowModel<AnimationsvideoerWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  DowloadedFilesRecord? mANU20alkoholmp4;
  // Model for BottomNavigation component.
  late BottomNavigationModel bottomNavigationModel;

  @override
  void initState(BuildContext context) {
    bottomNavigationModel = createModel(context, () => BottomNavigationModel());
  }

  @override
  void dispose() {
    bottomNavigationModel.dispose();
  }

  /// Action blocks.
  Future<String?> filePath(BuildContext context) async {
    await actions.getFilePaths(
      functions.fileName()!,
    );
    await actions.saveFileToHive(
      functions.fileName()!,
      functions.getFilePath()!,
    );

    return null;
  }
}
