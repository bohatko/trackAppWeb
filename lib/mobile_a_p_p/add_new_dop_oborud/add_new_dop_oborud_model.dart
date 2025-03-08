import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'add_new_dop_oborud_widget.dart' show AddNewDopOborudWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddNewDopOborudModel extends FlutterFlowModel<AddNewDopOborudWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown_dop widget.
  String? dropDownDopValue;
  FormFieldController<String>? dropDownDopValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SpravochnikDopRecord? dop;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
