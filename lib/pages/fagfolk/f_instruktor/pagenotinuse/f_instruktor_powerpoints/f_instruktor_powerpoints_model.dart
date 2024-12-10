import '/components/bottom_navigation/bottom_navigation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'f_instruktor_powerpoints_widget.dart' show FInstruktorPowerpointsWidget;
import 'package:flutter/material.dart';

class FInstruktorPowerpointsModel
    extends FlutterFlowModel<FInstruktorPowerpointsWidget> {
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
