import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'filter_by_widget.dart' show FilterByWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterByModel extends FlutterFlowModel<FilterByWidget> {
  ///  Local state fields for this component.

  List<String> selectedTehnik = [];
  void addToSelectedTehnik(String item) => selectedTehnik.add(item);
  void removeFromSelectedTehnik(String item) => selectedTehnik.remove(item);
  void removeAtIndexFromSelectedTehnik(int index) =>
      selectedTehnik.removeAt(index);
  void insertAtIndexInSelectedTehnik(int index, String item) =>
      selectedTehnik.insert(index, item);
  void updateSelectedTehnikAtIndex(int index, Function(String) updateFn) =>
      selectedTehnik[index] = updateFn(selectedTehnik[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for Checkbox widget.
  Map<TehnikaRecord, bool> checkboxValueMap = {};
  List<TehnikaRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
