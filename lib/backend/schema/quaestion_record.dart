import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuaestionRecord extends FirestoreRecord {
  QuaestionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "quaestion" field.
  String? _quaestion;
  String get quaestion => _quaestion ?? '';
  bool hasQuaestion() => _quaestion != null;

  // "ansver" field.
  String? _ansver;
  String get ansver => _ansver ?? '';
  bool hasAnsver() => _ansver != null;

  void _initializeFields() {
    _quaestion = snapshotData['quaestion'] as String?;
    _ansver = snapshotData['ansver'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quaestion');

  static Stream<QuaestionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuaestionRecord.fromSnapshot(s));

  static Future<QuaestionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuaestionRecord.fromSnapshot(s));

  static QuaestionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuaestionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuaestionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuaestionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuaestionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuaestionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuaestionRecordData({
  String? quaestion,
  String? ansver,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'quaestion': quaestion,
      'ansver': ansver,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuaestionRecordDocumentEquality implements Equality<QuaestionRecord> {
  const QuaestionRecordDocumentEquality();

  @override
  bool equals(QuaestionRecord? e1, QuaestionRecord? e2) {
    return e1?.quaestion == e2?.quaestion && e1?.ansver == e2?.ansver;
  }

  @override
  int hash(QuaestionRecord? e) =>
      const ListEquality().hash([e?.quaestion, e?.ansver]);

  @override
  bool isValidKey(Object? o) => o is QuaestionRecord;
}
