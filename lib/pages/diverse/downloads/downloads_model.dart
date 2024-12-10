import '/components/bottom_navigation/bottom_navigation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'downloads_widget.dart' show DownloadsWidget;
import 'package:flutter/material.dart';

class DownloadsModel extends FlutterFlowModel<DownloadsWidget> {
  ///  Local state fields for this page.

  DocumentReference? downloadFiles;

  ///  State fields for stateful widgets in this page.

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
  Future dokuments(BuildContext context) async {}
}
