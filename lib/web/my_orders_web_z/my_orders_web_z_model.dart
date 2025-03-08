import '';
import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/header_widget.dart';
import '/components/menu_web_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/mobile_a_p_p/components/list_empty_web/list_empty_web_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'my_orders_web_z_widget.dart' show MyOrdersWebZWidget;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:provider/provider.dart';

class MyOrdersWebZModel extends FlutterFlowModel<MyOrdersWebZWidget> {
  ///  Local state fields for this page.

  String selectedSatus = 'В работе';

  List<String> selectedCategory = [];
  void addToSelectedCategory(String item) => selectedCategory.add(item);
  void removeFromSelectedCategory(String item) => selectedCategory.remove(item);
  void removeAtIndexFromSelectedCategory(int index) =>
      selectedCategory.removeAt(index);
  void insertAtIndexInSelectedCategory(int index, String item) =>
      selectedCategory.insert(index, item);
  void updateSelectedCategoryAtIndex(int index, Function(String) updateFn) =>
      selectedCategory[index] = updateFn(selectedCategory[index]);

  DocumentReference? orderRef;

  ///  State fields for stateful widgets in this page.

  // Model for menuWeb component.
  late MenuWebModel menuWebModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for Column widget.
  ScrollController? columnController;
  Completer<List<OrdersRecord>>? firestoreRequestCompleter;
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
    listViewController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
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
