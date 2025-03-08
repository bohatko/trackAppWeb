// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilterHomeProjectStruct extends FFFirebaseStruct {
  FilterHomeProjectStruct({
    List<String>? city,
    int? price,
    List<String>? tekhnik,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _city = city,
        _price = price,
        _tekhnik = tekhnik,
        super(firestoreUtilData);

  // "city" field.
  List<String>? _city;
  List<String> get city => _city ?? const [];
  set city(List<String>? val) => _city = val;

  void updateCity(Function(List<String>) updateFn) {
    updateFn(_city ??= []);
  }

  bool hasCity() => _city != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;

  void incrementPrice(int amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "tekhnik" field.
  List<String>? _tekhnik;
  List<String> get tekhnik => _tekhnik ?? const [];
  set tekhnik(List<String>? val) => _tekhnik = val;

  void updateTekhnik(Function(List<String>) updateFn) {
    updateFn(_tekhnik ??= []);
  }

  bool hasTekhnik() => _tekhnik != null;

  static FilterHomeProjectStruct fromMap(Map<String, dynamic> data) =>
      FilterHomeProjectStruct(
        city: getDataList(data['city']),
        price: castToType<int>(data['price']),
        tekhnik: getDataList(data['tekhnik']),
      );

  static FilterHomeProjectStruct? maybeFromMap(dynamic data) => data is Map
      ? FilterHomeProjectStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'city': _city,
        'price': _price,
        'tekhnik': _tekhnik,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'city': serializeParam(
          _city,
          ParamType.String,
          isList: true,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
        'tekhnik': serializeParam(
          _tekhnik,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static FilterHomeProjectStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      FilterHomeProjectStruct(
        city: deserializeParam<String>(
          data['city'],
          ParamType.String,
          true,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
        tekhnik: deserializeParam<String>(
          data['tekhnik'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'FilterHomeProjectStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FilterHomeProjectStruct &&
        listEquality.equals(city, other.city) &&
        price == other.price &&
        listEquality.equals(tekhnik, other.tekhnik);
  }

  @override
  int get hashCode => const ListEquality().hash([city, price, tekhnik]);
}

FilterHomeProjectStruct createFilterHomeProjectStruct({
  int? price,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FilterHomeProjectStruct(
      price: price,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FilterHomeProjectStruct? updateFilterHomeProjectStruct(
  FilterHomeProjectStruct? filterHomeProject, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    filterHomeProject
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFilterHomeProjectStructData(
  Map<String, dynamic> firestoreData,
  FilterHomeProjectStruct? filterHomeProject,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (filterHomeProject == null) {
    return;
  }
  if (filterHomeProject.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && filterHomeProject.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final filterHomeProjectData =
      getFilterHomeProjectFirestoreData(filterHomeProject, forFieldValue);
  final nestedData =
      filterHomeProjectData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = filterHomeProject.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFilterHomeProjectFirestoreData(
  FilterHomeProjectStruct? filterHomeProject, [
  bool forFieldValue = false,
]) {
  if (filterHomeProject == null) {
    return {};
  }
  final firestoreData = mapToFirestore(filterHomeProject.toMap());

  // Add any Firestore field values
  filterHomeProject.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFilterHomeProjectListFirestoreData(
  List<FilterHomeProjectStruct>? filterHomeProjects,
) =>
    filterHomeProjects
        ?.map((e) => getFilterHomeProjectFirestoreData(e, true))
        .toList() ??
    [];
