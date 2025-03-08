// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SelectedTeknikStruct extends FFFirebaseStruct {
  SelectedTeknikStruct({
    String? classTekhnik,
    String? typeTekhnik,
    String? kindTekhnik,
    DocumentReference? tekhnikRef,
    int? rate,
    int? nacenka,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _classTekhnik = classTekhnik,
        _typeTekhnik = typeTekhnik,
        _kindTekhnik = kindTekhnik,
        _tekhnikRef = tekhnikRef,
        _rate = rate,
        _nacenka = nacenka,
        super(firestoreUtilData);

  // "classTekhnik" field.
  String? _classTekhnik;
  String get classTekhnik => _classTekhnik ?? '';
  set classTekhnik(String? val) => _classTekhnik = val;

  bool hasClassTekhnik() => _classTekhnik != null;

  // "typeTekhnik" field.
  String? _typeTekhnik;
  String get typeTekhnik => _typeTekhnik ?? '';
  set typeTekhnik(String? val) => _typeTekhnik = val;

  bool hasTypeTekhnik() => _typeTekhnik != null;

  // "kindTekhnik" field.
  String? _kindTekhnik;
  String get kindTekhnik => _kindTekhnik ?? '';
  set kindTekhnik(String? val) => _kindTekhnik = val;

  bool hasKindTekhnik() => _kindTekhnik != null;

  // "tekhnikRef" field.
  DocumentReference? _tekhnikRef;
  DocumentReference? get tekhnikRef => _tekhnikRef;
  set tekhnikRef(DocumentReference? val) => _tekhnikRef = val;

  bool hasTekhnikRef() => _tekhnikRef != null;

  // "rate" field.
  int? _rate;
  int get rate => _rate ?? 0;
  set rate(int? val) => _rate = val;

  void incrementRate(int amount) => rate = rate + amount;

  bool hasRate() => _rate != null;

  // "nacenka" field.
  int? _nacenka;
  int get nacenka => _nacenka ?? 0;
  set nacenka(int? val) => _nacenka = val;

  void incrementNacenka(int amount) => nacenka = nacenka + amount;

  bool hasNacenka() => _nacenka != null;

  static SelectedTeknikStruct fromMap(Map<String, dynamic> data) =>
      SelectedTeknikStruct(
        classTekhnik: data['classTekhnik'] as String?,
        typeTekhnik: data['typeTekhnik'] as String?,
        kindTekhnik: data['kindTekhnik'] as String?,
        tekhnikRef: data['tekhnikRef'] as DocumentReference?,
        rate: castToType<int>(data['rate']),
        nacenka: castToType<int>(data['nacenka']),
      );

  static SelectedTeknikStruct? maybeFromMap(dynamic data) => data is Map
      ? SelectedTeknikStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'classTekhnik': _classTekhnik,
        'typeTekhnik': _typeTekhnik,
        'kindTekhnik': _kindTekhnik,
        'tekhnikRef': _tekhnikRef,
        'rate': _rate,
        'nacenka': _nacenka,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'classTekhnik': serializeParam(
          _classTekhnik,
          ParamType.String,
        ),
        'typeTekhnik': serializeParam(
          _typeTekhnik,
          ParamType.String,
        ),
        'kindTekhnik': serializeParam(
          _kindTekhnik,
          ParamType.String,
        ),
        'tekhnikRef': serializeParam(
          _tekhnikRef,
          ParamType.DocumentReference,
        ),
        'rate': serializeParam(
          _rate,
          ParamType.int,
        ),
        'nacenka': serializeParam(
          _nacenka,
          ParamType.int,
        ),
      }.withoutNulls;

  static SelectedTeknikStruct fromSerializableMap(Map<String, dynamic> data) =>
      SelectedTeknikStruct(
        classTekhnik: deserializeParam(
          data['classTekhnik'],
          ParamType.String,
          false,
        ),
        typeTekhnik: deserializeParam(
          data['typeTekhnik'],
          ParamType.String,
          false,
        ),
        kindTekhnik: deserializeParam(
          data['kindTekhnik'],
          ParamType.String,
          false,
        ),
        tekhnikRef: deserializeParam(
          data['tekhnikRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['spravochnik_tekhnika'],
        ),
        rate: deserializeParam(
          data['rate'],
          ParamType.int,
          false,
        ),
        nacenka: deserializeParam(
          data['nacenka'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SelectedTeknikStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SelectedTeknikStruct &&
        classTekhnik == other.classTekhnik &&
        typeTekhnik == other.typeTekhnik &&
        kindTekhnik == other.kindTekhnik &&
        tekhnikRef == other.tekhnikRef &&
        rate == other.rate &&
        nacenka == other.nacenka;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [classTekhnik, typeTekhnik, kindTekhnik, tekhnikRef, rate, nacenka]);
}

SelectedTeknikStruct createSelectedTeknikStruct({
  String? classTekhnik,
  String? typeTekhnik,
  String? kindTekhnik,
  DocumentReference? tekhnikRef,
  int? rate,
  int? nacenka,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SelectedTeknikStruct(
      classTekhnik: classTekhnik,
      typeTekhnik: typeTekhnik,
      kindTekhnik: kindTekhnik,
      tekhnikRef: tekhnikRef,
      rate: rate,
      nacenka: nacenka,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SelectedTeknikStruct? updateSelectedTeknikStruct(
  SelectedTeknikStruct? selectedTeknik, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    selectedTeknik
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSelectedTeknikStructData(
  Map<String, dynamic> firestoreData,
  SelectedTeknikStruct? selectedTeknik,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (selectedTeknik == null) {
    return;
  }
  if (selectedTeknik.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && selectedTeknik.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final selectedTeknikData =
      getSelectedTeknikFirestoreData(selectedTeknik, forFieldValue);
  final nestedData =
      selectedTeknikData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = selectedTeknik.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSelectedTeknikFirestoreData(
  SelectedTeknikStruct? selectedTeknik, [
  bool forFieldValue = false,
]) {
  if (selectedTeknik == null) {
    return {};
  }
  final firestoreData = mapToFirestore(selectedTeknik.toMap());

  // Add any Firestore field values
  selectedTeknik.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSelectedTeknikListFirestoreData(
  List<SelectedTeknikStruct>? selectedTekniks,
) =>
    selectedTekniks
        ?.map((e) => getSelectedTeknikFirestoreData(e, true))
        .toList() ??
    [];
