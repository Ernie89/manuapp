import '/components/bottom_navigation/bottom_navigation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'nyheder_widget.dart' show NyhederWidget;
import 'package:flutter/material.dart';

class NyhederModel extends FlutterFlowModel<NyhederWidget> {
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
  Future menu(BuildContext context) async {}
}
