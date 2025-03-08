import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ActivityRecord extends FirestoreRecord {
  ActivityRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date_time" field.
  DateTime? _dateTime;
  DateTime? get dateTime => _dateTime;
  bool hasDateTime() => _dateTime != null;

  // "who_activ" field.
  String? _whoActiv;
  String get whoActiv => _whoActiv ?? '';
  bool hasWhoActiv() => _whoActiv != null;

  // "what_activ" field.
  String? _whatActiv;
  String get whatActiv => _whatActiv ?? '';
  bool hasWhatActiv() => _whatActiv != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _dateTime = snapshotData['date_time'] as DateTime?;
    _whoActiv = snapshotData['who_activ'] as String?;
    _whatActiv = snapshotData['what_activ'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('activity')
          : FirebaseFirestore.instance.collectionGroup('activity');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('activity').doc(id);

  static Stream<ActivityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ActivityRecord.fromSnapshot(s));

  static Future<ActivityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ActivityRecord.fromSnapshot(s));

  static ActivityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ActivityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ActivityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ActivityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ActivityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ActivityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createActivityRecordData({
  DateTime? dateTime,
  String? whoActiv,
  String? whatActiv,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date_time': dateTime,
      'who_activ': whoActiv,
      'what_activ': whatActiv,
    }.withoutNulls,
  );

  return firestoreData;
}

class ActivityRecordDocumentEquality implements Equality<ActivityRecord> {
  const ActivityRecordDocumentEquality();

  @override
  bool equals(ActivityRecord? e1, ActivityRecord? e2) {
    return e1?.dateTime == e2?.dateTime &&
        e1?.whoActiv == e2?.whoActiv &&
        e1?.whatActiv == e2?.whatActiv;
  }

  @override
  int hash(ActivityRecord? e) =>
      const ListEquality().hash([e?.dateTime, e?.whoActiv, e?.whatActiv]);

  @override
  bool isValidKey(Object? o) => o is ActivityRecord;
}
