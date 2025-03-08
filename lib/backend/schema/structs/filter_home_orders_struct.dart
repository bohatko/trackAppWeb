// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilterHomeOrdersStruct extends FFFirebaseStruct {
  FilterHomeOrdersStruct({
    String? name,
    bool? status,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _status = status,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? true;
  set status(bool? val) => _status = val;

  bool hasStatus() => _status != null;

  static FilterHomeOrdersStruct fromMap(Map<String, dynamic> data) =>
      FilterHomeOrdersStruct(
        name: data['name'] as String?,
        status: data['status'] as bool?,
      );

  static FilterHomeOrdersStruct? maybeFromMap(dynamic data) => data is Map
      ? FilterHomeOrdersStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'status': _status,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.bool,
        ),
      }.withoutNulls;

  static FilterHomeOrdersStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FilterHomeOrdersStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'FilterHomeOrdersStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FilterHomeOrdersStruct &&
        name == other.name &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality().hash([name, status]);
}

FilterHomeOrdersStruct createFilterHomeOrdersStruct({
  String? name,
  bool? status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FilterHomeOrdersStruct(
      name: name,
      status: status,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FilterHomeOrdersStruct? updateFilterHomeOrdersStruct(
  FilterHomeOrdersStruct? filterHomeOrders, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    filterHomeOrders
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFilterHomeOrdersStructData(
  Map<String, dynamic> firestoreData,
  FilterHomeOrdersStruct? filterHomeOrders,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (filterHomeOrders == null) {
    return;
  }
  if (filterHomeOrders.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && filterHomeOrders.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final filterHomeOrdersData =
      getFilterHomeOrdersFirestoreData(filterHomeOrders, forFieldValue);
  final nestedData =
      filterHomeOrdersData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = filterHomeOrders.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFilterHomeOrdersFirestoreData(
  FilterHomeOrdersStruct? filterHomeOrders, [
  bool forFieldValue = false,
]) {
  if (filterHomeOrders == null) {
    return {};
  }
  final firestoreData = mapToFirestore(filterHomeOrders.toMap());

  // Add any Firestore field values
  filterHomeOrders.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFilterHomeOrdersListFirestoreData(
  List<FilterHomeOrdersStruct>? filterHomeOrderss,
) =>
    filterHomeOrderss
        ?.map((e) => getFilterHomeOrdersFirestoreData(e, true))
        .toList() ??
    [];
