import '/backend/backend.dart';
import '/components/header_widget.dart';
import '/components/menu_web_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/mobile_a_p_p/components/list_empty3/list_empty3_widget.dart';
import 'dart:ui';
import 'ansvers_web_widget.dart' show AnsversWebWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AnsversWebModel extends FlutterFlowModel<AnsversWebWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for menuWeb component.
  late MenuWebModel menuWebModel;
  // Model for Header component.
  late HeaderModel headerModel;

  @override
  void initState(BuildContext context) {
    menuWebModel = createModel(context, () => MenuWebModel());
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    menuWebModel.dispose();
    headerModel.dispose();
  }
}
