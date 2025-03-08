import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyRecord extends FirestoreRecord {
  CompanyRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "company_name" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "company_inn" field.
  String? _companyInn;
  String get companyInn => _companyInn ?? '';
  bool hasCompanyInn() => _companyInn != null;

  // "company_kpp" field.
  String? _companyKpp;
  String get companyKpp => _companyKpp ?? '';
  bool hasCompanyKpp() => _companyKpp != null;

  // "company_bank" field.
  String? _companyBank;
  String get companyBank => _companyBank ?? '';
  bool hasCompanyBank() => _companyBank != null;

  // "company_rs" field.
  String? _companyRs;
  String get companyRs => _companyRs ?? '';
  bool hasCompanyRs() => _companyRs != null;

  // "company_adress" field.
  String? _companyAdress;
  String get companyAdress => _companyAdress ?? '';
  bool hasCompanyAdress() => _companyAdress != null;

  // "company_bik" field.
  String? _companyBik;
  String get companyBik => _companyBik ?? '';
  bool hasCompanyBik() => _companyBik != null;

  // "company_info" field.
  String? _companyInfo;
  String get companyInfo => _companyInfo ?? '';
  bool hasCompanyInfo() => _companyInfo != null;

  // "gendir" field.
  String? _gendir;
  String get gendir => _gendir ?? '';
  bool hasGendir() => _gendir != null;

  // "company_okpo" field.
  String? _companyOkpo;
  String get companyOkpo => _companyOkpo ?? '';
  bool hasCompanyOkpo() => _companyOkpo != null;

  // "company_ks" field.
  String? _companyKs;
  String get companyKs => _companyKs ?? '';
  bool hasCompanyKs() => _companyKs != null;

  // "company_orgn" field.
  String? _companyOrgn;
  String get companyOrgn => _companyOrgn ?? '';
  bool hasCompanyOrgn() => _companyOrgn != null;

  // "Is_moderate" field.
  bool? _isModerate;
  bool get isModerate => _isModerate ?? false;
  bool hasIsModerate() => _isModerate != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _companyName = snapshotData['company_name'] as String?;
    _companyInn = snapshotData['company_inn'] as String?;
    _companyKpp = snapshotData['company_kpp'] as String?;
    _companyBank = snapshotData['company_bank'] as String?;
    _companyRs = snapshotData['company_rs'] as String?;
    _companyAdress = snapshotData['company_adress'] as String?;
    _companyBik = snapshotData['company_bik'] as String?;
    _companyInfo = snapshotData['company_info'] as String?;
    _gendir = snapshotData['gendir'] as String?;
    _companyOkpo = snapshotData['company_okpo'] as String?;
    _companyKs = snapshotData['company_ks'] as String?;
    _companyOrgn = snapshotData['company_orgn'] as String?;
    _isModerate = snapshotData['Is_moderate'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('company')
          : FirebaseFirestore.instance.collectionGroup('company');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('company').doc(id);

  static Stream<CompanyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyRecord.fromSnapshot(s));

  static Future<CompanyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompanyRecord.fromSnapshot(s));

  static CompanyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyRecordData({
  String? companyName,
  String? companyInn,
  String? companyKpp,
  String? companyBank,
  String? companyRs,
  String? companyAdress,
  String? companyBik,
  String? companyInfo,
  String? gendir,
  String? companyOkpo,
  String? companyKs,
  String? companyOrgn,
  bool? isModerate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'company_name': companyName,
      'company_inn': companyInn,
      'company_kpp': companyKpp,
      'company_bank': companyBank,
      'company_rs': companyRs,
      'company_adress': companyAdress,
      'company_bik': companyBik,
      'company_info': companyInfo,
      'gendir': gendir,
      'company_okpo': companyOkpo,
      'company_ks': companyKs,
      'company_orgn': companyOrgn,
      'Is_moderate': isModerate,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyRecordDocumentEquality implements Equality<CompanyRecord> {
  const CompanyRecordDocumentEquality();

  @override
  bool equals(CompanyRecord? e1, CompanyRecord? e2) {
    return e1?.companyName == e2?.companyName &&
        e1?.companyInn == e2?.companyInn &&
        e1?.companyKpp == e2?.companyKpp &&
        e1?.companyBank == e2?.companyBank &&
        e1?.companyRs == e2?.companyRs &&
        e1?.companyAdress == e2?.companyAdress &&
        e1?.companyBik == e2?.companyBik &&
        e1?.companyInfo == e2?.companyInfo &&
        e1?.gendir == e2?.gendir &&
        e1?.companyOkpo == e2?.companyOkpo &&
        e1?.companyKs == e2?.companyKs &&
        e1?.companyOrgn == e2?.companyOrgn &&
        e1?.isModerate == e2?.isModerate;
  }

  @override
  int hash(CompanyRecord? e) => const ListEquality().hash([
        e?.companyName,
        e?.companyInn,
        e?.companyKpp,
        e?.companyBank,
        e?.companyRs,
        e?.companyAdress,
        e?.companyBik,
        e?.companyInfo,
        e?.gendir,
        e?.companyOkpo,
        e?.companyKs,
        e?.companyOrgn,
        e?.isModerate
      ]);

  @override
  bool isValidKey(Object? o) => o is CompanyRecord;
}
