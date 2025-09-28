import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/mobile_a_p_p/components/confirm_driver/confirm_driver_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'bs_add_new_driver_widget.dart' show BsAddNewDriverWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class BsAddNewDriverModel extends FlutterFlowModel<BsAddNewDriverWidget> {
  ///  Local state fields for this component.

  String pass = '@000000';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for fio widget.
  FocusNode? fioFocusNode;
  TextEditingController? fioTextController;
  String? Function(BuildContext, String?)? fioTextControllerValidator;
  // State field(s) for name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameTextController;
  String? Function(BuildContext, String?)? nameTextControllerValidator;
  // State field(s) for number widget.
  FocusNode? numberFocusNode;
  TextEditingController? numberTextController;
  late MaskTextInputFormatter numberMask;
  String? Function(BuildContext, String?)? numberTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyRecord? company;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    fioFocusNode?.dispose();
    fioTextController?.dispose();

    nameFocusNode?.dispose();
    nameTextController?.dispose();

    numberFocusNode?.dispose();
    numberTextController?.dispose();
  }
}
