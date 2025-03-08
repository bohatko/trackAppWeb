import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DocsRecord extends FirestoreRecord {
  DocsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "doc_schet" field.
  String? _docSchet;
  String get docSchet => _docSchet ?? '';
  bool hasDocSchet() => _docSchet != null;

  // "doc_esm2" field.
  String? _docEsm2;
  String get docEsm2 => _docEsm2 ?? '';
  bool hasDocEsm2() => _docEsm2 != null;

  // "doc_esm7" field.
  String? _docEsm7;
  String get docEsm7 => _docEsm7 ?? '';
  bool hasDocEsm7() => _docEsm7 != null;

  // "doc_esm7_isp" field.
  String? _docEsm7Isp;
  String get docEsm7Isp => _docEsm7Isp ?? '';
  bool hasDocEsm7Isp() => _docEsm7Isp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _docSchet = snapshotData['doc_schet'] as String?;
    _docEsm2 = snapshotData['doc_esm2'] as String?;
    _docEsm7 = snapshotData['doc_esm7'] as String?;
    _docEsm7Isp = snapshotData['doc_esm7_isp'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('docs')
          : FirebaseFirestore.instance.collectionGroup('docs');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('docs').doc(id);

  static Stream<DocsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DocsRecord.fromSnapshot(s));

  static Future<DocsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DocsRecord.fromSnapshot(s));

  static DocsRecord fromSnapshot(DocumentSnapshot snapshot) => DocsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DocsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DocsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DocsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DocsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDocsRecordData({
  String? docSchet,
  String? docEsm2,
  String? docEsm7,
  String? docEsm7Isp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'doc_schet': docSchet,
      'doc_esm2': docEsm2,
      'doc_esm7': docEsm7,
      'doc_esm7_isp': docEsm7Isp,
    }.withoutNulls,
  );

  return firestoreData;
}

class DocsRecordDocumentEquality implements Equality<DocsRecord> {
  const DocsRecordDocumentEquality();

  @override
  bool equals(DocsRecord? e1, DocsRecord? e2) {
    return e1?.docSchet == e2?.docSchet &&
        e1?.docEsm2 == e2?.docEsm2 &&
        e1?.docEsm7 == e2?.docEsm7 &&
        e1?.docEsm7Isp == e2?.docEsm7Isp;
  }

  @override
  int hash(DocsRecord? e) => const ListEquality()
      .hash([e?.docSchet, e?.docEsm2, e?.docEsm7, e?.docEsm7Isp]);

  @override
  bool isValidKey(Object? o) => o is DocsRecord;
}
