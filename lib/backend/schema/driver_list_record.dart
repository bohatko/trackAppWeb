import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DriverListRecord extends FirestoreRecord {
  DriverListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "assigned_ispolnitel" field.
  DocumentReference? _assignedIspolnitel;
  DocumentReference? get assignedIspolnitel => _assignedIspolnitel;
  bool hasAssignedIspolnitel() => _assignedIspolnitel != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "company_ref" field.
  DocumentReference? _companyRef;
  DocumentReference? get companyRef => _companyRef;
  bool hasCompanyRef() => _companyRef != null;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _assignedIspolnitel =
        snapshotData['assigned_ispolnitel'] as DocumentReference?;
    _lastName = snapshotData['last_name'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _companyRef = snapshotData['company_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('driver_list');

  static Stream<DriverListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DriverListRecord.fromSnapshot(s));

  static Future<DriverListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DriverListRecord.fromSnapshot(s));

  static DriverListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DriverListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DriverListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DriverListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DriverListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DriverListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDriverListRecordData({
  DateTime? createdTime,
  String? phoneNumber,
  DocumentReference? assignedIspolnitel,
  String? lastName,
  String? displayName,
  DocumentReference? companyRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'assigned_ispolnitel': assignedIspolnitel,
      'last_name': lastName,
      'display_name': displayName,
      'company_ref': companyRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class DriverListRecordDocumentEquality implements Equality<DriverListRecord> {
  const DriverListRecordDocumentEquality();

  @override
  bool equals(DriverListRecord? e1, DriverListRecord? e2) {
    return e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.assignedIspolnitel == e2?.assignedIspolnitel &&
        e1?.lastName == e2?.lastName &&
        e1?.displayName == e2?.displayName &&
        e1?.companyRef == e2?.companyRef;
  }

  @override
  int hash(DriverListRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.phoneNumber,
        e?.assignedIspolnitel,
        e?.lastName,
        e?.displayName,
        e?.companyRef
      ]);

  @override
  bool isValidKey(Object? o) => o is DriverListRecord;
}
