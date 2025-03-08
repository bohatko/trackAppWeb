import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/list_empty_driver_widget.dart';
import '/components/list_empty_tehnik_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'modal_add_offer_widget.dart' show ModalAddOfferWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ModalAddOfferModel extends FlutterFlowModel<ModalAddOfferWidget> {
  ///  Local state fields for this component.

  String? driverDisplayName;

  int? driverID;

  String? driverLastName;

  String? selectedTehnik;

  String? selectedTehnikGosNomer;

  DocumentReference? selectedTehnikRef;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? driver;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyRecord? company;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? chatOfer;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OffersRecord? newffer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
