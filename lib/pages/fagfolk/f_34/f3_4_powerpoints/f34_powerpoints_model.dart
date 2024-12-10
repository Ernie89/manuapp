import '/components/bottom_navigation/bottom_navigation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'f34_powerpoints_widget.dart' show F34PowerpointsWidget;
import 'package:flutter/material.dart';

class F34PowerpointsModel extends FlutterFlowModel<F34PowerpointsWidget> {
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
}
