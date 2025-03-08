import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/header_widget.dart';
import '/components/menu_web_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'more_orders_z_widget.dart' show MoreOrdersZWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class MoreOrdersZModel extends FlutterFlowModel<MoreOrdersZWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for menuWeb component.
  late MenuWebModel menuWebModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    menuWebModel = createModel(context, () => MenuWebModel());
    headerModel = createModel(context, () => HeaderModel());
    columnController = ScrollController();
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    menuWebModel.dispose();
    headerModel.dispose();
    columnController?.dispose();
    expandableExpandableController.dispose();
    listViewController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
