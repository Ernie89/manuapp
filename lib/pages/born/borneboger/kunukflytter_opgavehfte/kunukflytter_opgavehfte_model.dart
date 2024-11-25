import '/components/bottom_navigation/bottom_navigation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'kunukflytter_opgavehfte_widget.dart' show KunukflytterOpgavehfteWidget;
import 'package:flutter/material.dart';

class KunukflytterOpgavehfteModel
    extends FlutterFlowModel<KunukflytterOpgavehfteWidget> {
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
