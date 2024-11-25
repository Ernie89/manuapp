import '/components/bottom_navigation/bottom_navigation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ditbarnslegogbevgelse_widget.dart' show DitbarnslegogbevgelseWidget;
import 'package:flutter/material.dart';

class DitbarnslegogbevgelseModel
    extends FlutterFlowModel<DitbarnslegogbevgelseWidget> {
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
