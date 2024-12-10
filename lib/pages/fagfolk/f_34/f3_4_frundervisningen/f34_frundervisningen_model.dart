import '/components/bottom_navigation/bottom_navigation_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'f34_frundervisningen_widget.dart' show F34FrundervisningenWidget;
import 'package:flutter/material.dart';

class F34FrundervisningenModel
    extends FlutterFlowModel<F34FrundervisningenWidget> {
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
