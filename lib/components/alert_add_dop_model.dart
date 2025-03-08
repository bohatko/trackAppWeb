import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/mobile_a_p_p/components/list_empty_web/list_empty_web_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'alert_add_dop_widget.dart' show AlertAddDopWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AlertAddDopModel extends FlutterFlowModel<AlertAddDopWidget> {
  ///  Local state fields for this component.

  List<int> selectedDop = [];
  void addToSelectedDop(int item) => selectedDop.add(item);
  void removeFromSelectedDop(int item) => selectedDop.remove(item);
  void removeAtIndexFromSelectedDop(int index) => selectedDop.removeAt(index);
  void insertAtIndexInSelectedDop(int index, int item) =>
      selectedDop.insert(index, item);
  void updateSelectedDopAtIndex(int index, Function(int) updateFn) =>
      selectedDop[index] = updateFn(selectedDop[index]);

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SpravochnikDopRecord? dop;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
