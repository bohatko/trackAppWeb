import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/list_empty_driver_widget.dart';
import '/components/list_empty_tehnik_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'alert_add_offer_widget.dart' show AlertAddOfferWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AlertAddOfferModel extends FlutterFlowModel<AlertAddOfferWidget> {
  ///  Local state fields for this component.

  String? driverDisplayName;

  int? driverID;

  String? driverLastName;

  String? selectedTehnik;

  String? selectedTehnikGosNomer;

  DocumentReference? selectedTehnikRef;

  List<DocumentReference> dopDocs = [];
  void addToDopDocs(DocumentReference item) => dopDocs.add(item);
  void removeFromDopDocs(DocumentReference item) => dopDocs.remove(item);
  void removeAtIndexFromDopDocs(int index) => dopDocs.removeAt(index);
  void insertAtIndexInDopDocs(int index, DocumentReference item) =>
      dopDocs.insert(index, item);
  void updateDopDocsAtIndex(int index, Function(DocumentReference) updateFn) =>
      dopDocs[index] = updateFn(dopDocs[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for predlozhenie widget.
  FocusNode? predlozhenieFocusNode;
  TextEditingController? predlozhenieTextController;
  String? Function(BuildContext, String?)? predlozhenieTextControllerValidator;
  Completer<List<TehnikaRecord>>? firestoreRequestCompleter1;
  Completer<List<DopOborudRecord>>? firestoreRequestCompleter3;
  Completer<List<UsersRecord>>? firestoreRequestCompleter2;
  // State field(s) for summOffer widget.
  FocusNode? summOfferFocusNode;
  TextEditingController? summOfferTextController;
  String? Function(BuildContext, String?)? summOfferTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? driver;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyRecord? company;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? chatOfer;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OffersRecord? newoffer2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    predlozhenieFocusNode?.dispose();
    predlozhenieTextController?.dispose();

    summOfferFocusNode?.dispose();
    summOfferTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForFirestoreRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForFirestoreRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter3?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForFirestoreRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
