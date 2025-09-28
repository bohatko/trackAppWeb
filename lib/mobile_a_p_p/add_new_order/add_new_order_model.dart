import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/list_empty_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'add_new_order_widget.dart' show AddNewOrderWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class AddNewOrderModel extends FlutterFlowModel<AddNewOrderWidget> {
  ///  Local state fields for this page.

  int selectedTehnikRate = 1;

  int? selectedTehnikIndex;

  List<int> selectedDopRate = [];
  void addToSelectedDopRate(int item) => selectedDopRate.add(item);
  void removeFromSelectedDopRate(int item) => selectedDopRate.remove(item);
  void removeAtIndexFromSelectedDopRate(int index) =>
      selectedDopRate.removeAt(index);
  void insertAtIndexInSelectedDopRate(int index, int item) =>
      selectedDopRate.insert(index, item);
  void updateSelectedDopRateAtIndex(int index, Function(int) updateFn) =>
      selectedDopRate[index] = updateFn(selectedDopRate[index]);

  String selectedTehnikName = 'Не указана';

  List<String> selectedDopName = [];
  void addToSelectedDopName(String item) => selectedDopName.add(item);
  void removeFromSelectedDopName(String item) => selectedDopName.remove(item);
  void removeAtIndexFromSelectedDopName(int index) =>
      selectedDopName.removeAt(index);
  void insertAtIndexInSelectedDopName(int index, String item) =>
      selectedDopName.insert(index, item);
  void updateSelectedDopNameAtIndex(int index, Function(String) updateFn) =>
      selectedDopName[index] = updateFn(selectedDopName[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Add_new_order widget.
  List<SpravochnikTekhnikaRecord>? alltehnik;
  // State field(s) for type_technik widget.
  String? typeTechnikValue;
  FormFieldController<String>? typeTechnikValueController;
  // State field(s) for discription_order widget.
  FocusNode? discriptionOrderFocusNode;
  TextEditingController? discriptionOrderTextController;
  String? Function(BuildContext, String?)?
      discriptionOrderTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for smena widget.
  FocusNode? smenaFocusNode;
  TextEditingController? smenaTextController;
  String? Function(BuildContext, String?)? smenaTextControllerValidator;
  // State field(s) for hours widget.
  String? hoursValue;
  FormFieldController<String>? hoursValueController;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  late MaskTextInputFormatter phoneNumberMask;
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for need_doc widget.
  bool? needDocValue;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for Checkbox widget.
  Map<SpravochnikDopRecord, bool> checkboxValueMap = {};
  List<SpravochnikDopRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? q1;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? manager;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrdersRecord? createdOrder;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyRecord? companyZ;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? chat;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    discriptionOrderFocusNode?.dispose();
    discriptionOrderTextController?.dispose();

    smenaFocusNode?.dispose();
    smenaTextController?.dispose();

    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();
  }
}
