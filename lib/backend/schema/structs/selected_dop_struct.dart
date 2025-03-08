// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SelectedDopStruct extends FFFirebaseStruct {
  SelectedDopStruct({
    String? dopName,
    int? rate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _dopName = dopName,
        _rate = rate,
        super(firestoreUtilData);

  // "dop_name" field.
  String? _dopName;
  String get dopName => _dopName ?? '';
  set dopName(String? val) => _dopName = val;

  bool hasDopName() => _dopName != null;

  // "rate" field.
  int? _rate;
  int get rate => _rate ?? 0;
  set rate(int? val) => _rate = val;

  void incrementRate(int amount) => rate = rate + amount;

  bool hasRate() => _rate != null;

  static SelectedDopStruct fromMap(Map<String, dynamic> data) =>
      SelectedDopStruct(
        dopName: data['dop_name'] as String?,
        rate: castToType<int>(data['rate']),
      );

  static SelectedDopStruct? maybeFromMap(dynamic data) => data is Map
      ? SelectedDopStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'dop_name': _dopName,
        'rate': _rate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'dop_name': serializeParam(
          _dopName,
          ParamType.String,
        ),
        'rate': serializeParam(
          _rate,
          ParamType.int,
        ),
      }.withoutNulls;

  static SelectedDopStruct fromSerializableMap(Map<String, dynamic> data) =>
      SelectedDopStruct(
        dopName: deserializeParam(
          data['dop_name'],
          ParamType.String,
          false,
        ),
        rate: deserializeParam(
          data['rate'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SelectedDopStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SelectedDopStruct &&
        dopName == other.dopName &&
        rate == other.rate;
  }

  @override
  int get hashCode => const ListEquality().hash([dopName, rate]);
}

SelectedDopStruct createSelectedDopStruct({
  String? dopName,
  int? rate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SelectedDopStruct(
      dopName: dopName,
      rate: rate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SelectedDopStruct? updateSelectedDopStruct(
  SelectedDopStruct? selectedDop, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    selectedDop
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSelectedDopStructData(
  Map<String, dynamic> firestoreData,
  SelectedDopStruct? selectedDop,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (selectedDop == null) {
    return;
  }
  if (selectedDop.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && selectedDop.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final selectedDopData =
      getSelectedDopFirestoreData(selectedDop, forFieldValue);
  final nestedData =
      selectedDopData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = selectedDop.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSelectedDopFirestoreData(
  SelectedDopStruct? selectedDop, [
  bool forFieldValue = false,
]) {
  if (selectedDop == null) {
    return {};
  }
  final firestoreData = mapToFirestore(selectedDop.toMap());

  // Add any Firestore field values
  selectedDop.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSelectedDopListFirestoreData(
  List<SelectedDopStruct>? selectedDops,
) =>
    selectedDops?.map((e) => getSelectedDopFirestoreData(e, true)).toList() ??
    [];
