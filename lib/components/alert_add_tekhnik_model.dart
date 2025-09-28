import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/mobile_a_p_p/components/list_empty_web/list_empty_web_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'alert_add_tekhnik_widget.dart' show AlertAddTekhnikWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AlertAddTekhnikModel extends FlutterFlowModel<AlertAddTekhnikWidget> {
  ///  Local state fields for this component.

  DocumentReference? selectedTehnika;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for class_tehnik widget.
  String? classTehnikValue;
  FormFieldController<String>? classTehnikValueController;
  // State field(s) for type_tehnik widget.
  String? typeTehnikValue;
  FormFieldController<String>? typeTehnikValueController;
  // State field(s) for vid_tehnik widget.
  String? vidTehnikValue;
  FormFieldController<String>? vidTehnikValueController;
  // State field(s) for model_tehnik widget.
  String? modelTehnikValue;
  FormFieldController<String>? modelTehnikValueController;
  // State field(s) for gos_nomer widget.
  FocusNode? gosNomerFocusNode;
  TextEditingController? gosNomerTextController;
  String? Function(BuildContext, String?)? gosNomerTextControllerValidator;
  // State field(s) for gos_nomer_short widget.
  FocusNode? gosNomerShortFocusNode;
  TextEditingController? gosNomerShortTextController;
  String? Function(BuildContext, String?)? gosNomerShortTextControllerValidator;
  // State field(s) for datchik_vialon widget.
  FocusNode? datchikVialonFocusNode;
  TextEditingController? datchikVialonTextController;
  String? Function(BuildContext, String?)? datchikVialonTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    gosNomerFocusNode?.dispose();
    gosNomerTextController?.dispose();

    gosNomerShortFocusNode?.dispose();
    gosNomerShortTextController?.dispose();

    datchikVialonFocusNode?.dispose();
    datchikVialonTextController?.dispose();
  }
}
