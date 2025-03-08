import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RevievsRecord extends FirestoreRecord {
  RevievsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "name_owner_rev" field.
  String? _nameOwnerRev;
  String get nameOwnerRev => _nameOwnerRev ?? '';
  bool hasNameOwnerRev() => _nameOwnerRev != null;

  // "foto_owner_rev" field.
  String? _fotoOwnerRev;
  String get fotoOwnerRev => _fotoOwnerRev ?? '';
  bool hasFotoOwnerRev() => _fotoOwnerRev != null;

  // "grade" field.
  double? _grade;
  double get grade => _grade ?? 0.0;
  bool hasGrade() => _grade != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = snapshotData['date'] as DateTime?;
    _text = snapshotData['text'] as String?;
    _nameOwnerRev = snapshotData['name_owner_rev'] as String?;
    _fotoOwnerRev = snapshotData['foto_owner_rev'] as String?;
    _grade = castToType<double>(snapshotData['grade']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('revievs')
          : FirebaseFirestore.instance.collectionGroup('revievs');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('revievs').doc(id);

  static Stream<RevievsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RevievsRecord.fromSnapshot(s));

  static Future<RevievsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RevievsRecord.fromSnapshot(s));

  static RevievsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RevievsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RevievsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RevievsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RevievsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RevievsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRevievsRecordData({
  DateTime? date,
  String? text,
  String? nameOwnerRev,
  String? fotoOwnerRev,
  double? grade,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'text': text,
      'name_owner_rev': nameOwnerRev,
      'foto_owner_rev': fotoOwnerRev,
      'grade': grade,
    }.withoutNulls,
  );

  return firestoreData;
}

class RevievsRecordDocumentEquality implements Equality<RevievsRecord> {
  const RevievsRecordDocumentEquality();

  @override
  bool equals(RevievsRecord? e1, RevievsRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.text == e2?.text &&
        e1?.nameOwnerRev == e2?.nameOwnerRev &&
        e1?.fotoOwnerRev == e2?.fotoOwnerRev &&
        e1?.grade == e2?.grade;
  }

  @override
  int hash(RevievsRecord? e) => const ListEquality()
      .hash([e?.date, e?.text, e?.nameOwnerRev, e?.fotoOwnerRev, e?.grade]);

  @override
  bool isValidKey(Object? o) => o is RevievsRecord;
}
