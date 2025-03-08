import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DopOborudRecord extends FirestoreRecord {
  DopOborudRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  bool hasModel() => _model != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "category_dop_ob" field.
  String? _categoryDopOb;
  String get categoryDopOb => _categoryDopOb ?? '';
  bool hasCategoryDopOb() => _categoryDopOb != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _model = snapshotData['model'] as String?;
    _image = snapshotData['image'] as String?;
    _status = snapshotData['status'] as bool?;
    _categoryDopOb = snapshotData['category_dop_ob'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('dop_oborud')
          : FirebaseFirestore.instance.collectionGroup('dop_oborud');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('dop_oborud').doc(id);

  static Stream<DopOborudRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DopOborudRecord.fromSnapshot(s));

  static Future<DopOborudRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DopOborudRecord.fromSnapshot(s));

  static DopOborudRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DopOborudRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DopOborudRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DopOborudRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DopOborudRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DopOborudRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDopOborudRecordData({
  String? name,
  String? model,
  String? image,
  bool? status,
  String? categoryDopOb,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'model': model,
      'image': image,
      'status': status,
      'category_dop_ob': categoryDopOb,
    }.withoutNulls,
  );

  return firestoreData;
}

class DopOborudRecordDocumentEquality implements Equality<DopOborudRecord> {
  const DopOborudRecordDocumentEquality();

  @override
  bool equals(DopOborudRecord? e1, DopOborudRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.model == e2?.model &&
        e1?.image == e2?.image &&
        e1?.status == e2?.status &&
        e1?.categoryDopOb == e2?.categoryDopOb;
  }

  @override
  int hash(DopOborudRecord? e) => const ListEquality()
      .hash([e?.name, e?.model, e?.image, e?.status, e?.categoryDopOb]);

  @override
  bool isValidKey(Object? o) => o is DopOborudRecord;
}
