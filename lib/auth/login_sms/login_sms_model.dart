import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'login_sms_widget.dart' show LoginSmsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class LoginSmsModel extends FlutterFlowModel<LoginSmsWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField121212 widget.
  FocusNode? textField121212FocusNode;
  TextEditingController? textField121212TextController;
  final textField121212Mask = MaskTextInputFormatter(mask: '(###)-###-##-##');
  String? Function(BuildContext, String?)?
      textField121212TextControllerValidator;
  // Stores action output result for [Backend Call - API (smsAuth)] action in Button widget.
  ApiCallResponse? apiResultm0g;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textField121212FocusNode?.dispose();
    textField121212TextController?.dispose();
  }
}
