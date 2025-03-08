import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpravochnikDopRecord extends FirestoreRecord {
  SpravochnikDopRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "sort_by" field.
  int? _sortBy;
  int get sortBy => _sortBy ?? 0;
  bool hasSortBy() => _sortBy != null;

  // "is_show" field.
  bool? _isShow;
  bool get isShow => _isShow ?? false;
  bool hasIsShow() => _isShow != null;

  // "rate" field.
  int? _rate;
  int get rate => _rate ?? 0;
  bool hasRate() => _rate != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "model" field.
  String? _model;
  String get model => _model ?? '';
  bool hasModel() => _model != null;

  // "category_dop_ob" field.
  String? _categoryDopOb;
  String get categoryDopOb => _categoryDopOb ?? '';
  bool hasCategoryDopOb() => _categoryDopOb != null;

  // "custom_id" field.
  int? _customId;
  int get customId => _customId ?? 0;
  bool hasCustomId() => _customId != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _sortBy = castToType<int>(snapshotData['sort_by']);
    _isShow = snapshotData['is_show'] as bool?;
    _rate = castToType<int>(snapshotData['rate']);
    _image = snapshotData['image'] as String?;
    _model = snapshotData['model'] as String?;
    _categoryDopOb = snapshotData['category_dop_ob'] as String?;
    _customId = castToType<int>(snapshotData['custom_id']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('spravochnik_dop');

  static Stream<SpravochnikDopRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SpravochnikDopRecord.fromSnapshot(s));

  static Future<SpravochnikDopRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SpravochnikDopRecord.fromSnapshot(s));

  static SpravochnikDopRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SpravochnikDopRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SpravochnikDopRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SpravochnikDopRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SpravochnikDopRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SpravochnikDopRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSpravochnikDopRecordData({
  String? name,
  int? sortBy,
  bool? isShow,
  int? rate,
  String? image,
  String? model,
  String? categoryDopOb,
  int? customId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'sort_by': sortBy,
      'is_show': isShow,
      'rate': rate,
      'image': image,
      'model': model,
      'category_dop_ob': categoryDopOb,
      'custom_id': customId,
    }.withoutNulls,
  );

  return firestoreData;
}

class SpravochnikDopRecordDocumentEquality
    implements Equality<SpravochnikDopRecord> {
  const SpravochnikDopRecordDocumentEquality();

  @override
  bool equals(SpravochnikDopRecord? e1, SpravochnikDopRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.sortBy == e2?.sortBy &&
        e1?.isShow == e2?.isShow &&
        e1?.rate == e2?.rate &&
        e1?.image == e2?.image &&
        e1?.model == e2?.model &&
        e1?.categoryDopOb == e2?.categoryDopOb &&
        e1?.customId == e2?.customId;
  }

  @override
  int hash(SpravochnikDopRecord? e) => const ListEquality().hash([
        e?.name,
        e?.sortBy,
        e?.isShow,
        e?.rate,
        e?.image,
        e?.model,
        e?.categoryDopOb,
        e?.customId
      ]);

  @override
  bool isValidKey(Object? o) => o is SpravochnikDopRecord;
}
