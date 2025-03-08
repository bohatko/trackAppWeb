import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/mobile_a_p_p/components/modal_add_new_tehnik/modal_add_new_tehnik_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'add_new_technik_widget.dart' show AddNewTechnikWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddNewTechnikModel extends FlutterFlowModel<AddNewTechnikWidget> {
  ///  Local state fields for this page.

  List<String> classTehnik = [];
  void addToClassTehnik(String item) => classTehnik.add(item);
  void removeFromClassTehnik(String item) => classTehnik.remove(item);
  void removeAtIndexFromClassTehnik(int index) => classTehnik.removeAt(index);
  void insertAtIndexInClassTehnik(int index, String item) =>
      classTehnik.insert(index, item);
  void updateClassTehnikAtIndex(int index, Function(String) updateFn) =>
      classTehnik[index] = updateFn(classTehnik[index]);

  List<String> typeTehnik = [];
  void addToTypeTehnik(String item) => typeTehnik.add(item);
  void removeFromTypeTehnik(String item) => typeTehnik.remove(item);
  void removeAtIndexFromTypeTehnik(int index) => typeTehnik.removeAt(index);
  void insertAtIndexInTypeTehnik(int index, String item) =>
      typeTehnik.insert(index, item);
  void updateTypeTehnikAtIndex(int index, Function(String) updateFn) =>
      typeTehnik[index] = updateFn(typeTehnik[index]);

  List<String> kindTehnik = [];
  void addToKindTehnik(String item) => kindTehnik.add(item);
  void removeFromKindTehnik(String item) => kindTehnik.remove(item);
  void removeAtIndexFromKindTehnik(int index) => kindTehnik.removeAt(index);
  void insertAtIndexInKindTehnik(int index, String item) =>
      kindTehnik.insert(index, item);
  void updateKindTehnikAtIndex(int index, Function(String) updateFn) =>
      kindTehnik[index] = updateFn(kindTehnik[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for class_tehnik widget.
  String? classTehnikValue;
  FormFieldController<String>? classTehnikValueController;
  // State field(s) for type_tehnik widget.
  String? typeTehnikValue;
  FormFieldController<String>? typeTehnikValueController;
  // State field(s) for kind_tehnik widget.
  String? kindTehnikValue;
  FormFieldController<String>? kindTehnikValueController;
  // State field(s) for gruzopod widget.
  FocusNode? gruzopodFocusNode;
  TextEditingController? gruzopodTextController;
  String? Function(BuildContext, String?)? gruzopodTextControllerValidator;
  String? _gruzopodTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return ' ';
    }

    if (val.length < 1) {
      return 'Requires at least 1 characters.';
    }

    return null;
  }

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
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SpravochnikTekhnikaRecord? r4t5y6;

  @override
  void initState(BuildContext context) {
    gruzopodTextControllerValidator = _gruzopodTextControllerValidator;
  }

  @override
  void dispose() {
    gruzopodFocusNode?.dispose();
    gruzopodTextController?.dispose();

    gosNomerFocusNode?.dispose();
    gosNomerTextController?.dispose();

    gosNomerShortFocusNode?.dispose();
    gosNomerShortTextController?.dispose();

    datchikVialonFocusNode?.dispose();
    datchikVialonTextController?.dispose();
  }
}
