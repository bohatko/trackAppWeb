import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/header_widget.dart';
import '/components/menu_web_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'oferta_web_widget.dart' show OfertaWebWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OfertaWebModel extends FlutterFlowModel<OfertaWebWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for menuWeb component.
  late MenuWebModel menuWebModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;

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
