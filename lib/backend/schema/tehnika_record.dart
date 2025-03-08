import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TehnikaRecord extends FirestoreRecord {
  TehnikaRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "prepar_location" field.
  String? _preparLocation;
  String get preparLocation => _preparLocation ?? '';
  bool hasPreparLocation() => _preparLocation != null;

  // "is_moderate" field.
  bool? _isModerate;
  bool get isModerate => _isModerate ?? false;
  bool hasIsModerate() => _isModerate != null;

  // "driver" field.
  DocumentReference? _driver;
  DocumentReference? get driver => _driver;
  bool hasDriver() => _driver != null;

  // "gos_number" field.
  String? _gosNumber;
  String get gosNumber => _gosNumber ?? '';
  bool hasGosNumber() => _gosNumber != null;

  // "wialon_number" field.
  String? _wialonNumber;
  String get wialonNumber => _wialonNumber ?? '';
  bool hasWialonNumber() => _wialonNumber != null;

  // "in_offer" field.
  List<DocumentReference>? _inOffer;
  List<DocumentReference> get inOffer => _inOffer ?? const [];
  bool hasInOffer() => _inOffer != null;

  // "tehnika_ref" field.
  DocumentReference? _tehnikaRef;
  DocumentReference? get tehnikaRef => _tehnikaRef;
  bool hasTehnikaRef() => _tehnikaRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _preparLocation = snapshotData['prepar_location'] as String?;
    _isModerate = snapshotData['is_moderate'] as bool?;
    _driver = snapshotData['driver'] as DocumentReference?;
    _gosNumber = snapshotData['gos_number'] as String?;
    _wialonNumber = snapshotData['wialon_number'] as String?;
    _inOffer = getDataList(snapshotData['in_offer']);
    _tehnikaRef = snapshotData['tehnika_ref'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('tehnika')
          : FirebaseFirestore.instance.collectionGroup('tehnika');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('tehnika').doc(id);

  static Stream<TehnikaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TehnikaRecord.fromSnapshot(s));

  static Future<TehnikaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TehnikaRecord.fromSnapshot(s));

  static TehnikaRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TehnikaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TehnikaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TehnikaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TehnikaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TehnikaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTehnikaRecordData({
  String? preparLocation,
  bool? isModerate,
  DocumentReference? driver,
  String? gosNumber,
  String? wialonNumber,
  DocumentReference? tehnikaRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'prepar_location': preparLocation,
      'is_moderate': isModerate,
      'driver': driver,
      'gos_number': gosNumber,
      'wialon_number': wialonNumber,
      'tehnika_ref': tehnikaRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class TehnikaRecordDocumentEquality implements Equality<TehnikaRecord> {
  const TehnikaRecordDocumentEquality();

  @override
  bool equals(TehnikaRecord? e1, TehnikaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.preparLocation == e2?.preparLocation &&
        e1?.isModerate == e2?.isModerate &&
        e1?.driver == e2?.driver &&
        e1?.gosNumber == e2?.gosNumber &&
        e1?.wialonNumber == e2?.wialonNumber &&
        listEquality.equals(e1?.inOffer, e2?.inOffer) &&
        e1?.tehnikaRef == e2?.tehnikaRef;
  }

  @override
  int hash(TehnikaRecord? e) => const ListEquality().hash([
        e?.preparLocation,
        e?.isModerate,
        e?.driver,
        e?.gosNumber,
        e?.wialonNumber,
        e?.inOffer,
        e?.tehnikaRef
      ]);

  @override
  bool isValidKey(Object? o) => o is TehnikaRecord;
}
