import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/header_widget.dart';
import '/components/menu_web_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/mobile_a_p_p/components/list_empty_web/list_empty_web_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'orders_web_i_widget.dart' show OrdersWebIWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrdersWebIModel extends FlutterFlowModel<OrdersWebIWidget> {
  ///  Local state fields for this page.

  String? selectedSatus = 'Все заказы';

  List<String> selectedCategory = [];
  void addToSelectedCategory(String item) => selectedCategory.add(item);
  void removeFromSelectedCategory(String item) => selectedCategory.remove(item);
  void removeAtIndexFromSelectedCategory(int index) =>
      selectedCategory.removeAt(index);
  void insertAtIndexInSelectedCategory(int index, String item) =>
      selectedCategory.insert(index, item);
  void updateSelectedCategoryAtIndex(int index, Function(String) updateFn) =>
      selectedCategory[index] = updateFn(selectedCategory[index]);

  String sortBy = '1';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in OrdersWeb_I widget.
  TehnikaRecord? userTehnike;
  // Model for menuWeb component.
  late MenuWebModel menuWebModel;
  // Model for Header component.
  late HeaderModel headerModel;
  Completer<List<OrdersRecord>>? firestoreRequestCompleter;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  OffersRecord? isWinoffer;
  // State field(s) for Slider widget.
  double? sliderValue;

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

  /// Additional helper methods.
  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
