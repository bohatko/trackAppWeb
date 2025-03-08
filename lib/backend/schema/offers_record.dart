import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OffersRecord extends FirestoreRecord {
  OffersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "text_offer" field.
  String? _textOffer;
  String get textOffer => _textOffer ?? '';
  bool hasTextOffer() => _textOffer != null;

  // "price_offer" field.
  int? _priceOffer;
  int get priceOffer => _priceOffer ?? 0;
  bool hasPriceOffer() => _priceOffer != null;

  // "user_offer" field.
  DocumentReference? _userOffer;
  DocumentReference? get userOffer => _userOffer;
  bool hasUserOffer() => _userOffer != null;

  // "is_win" field.
  bool? _isWin;
  bool get isWin => _isWin ?? false;
  bool hasIsWin() => _isWin != null;

  // "name_company" field.
  String? _nameCompany;
  String get nameCompany => _nameCompany ?? '';
  bool hasNameCompany() => _nameCompany != null;

  // "tehnika_ref" field.
  DocumentReference? _tehnikaRef;
  DocumentReference? get tehnikaRef => _tehnikaRef;
  bool hasTehnikaRef() => _tehnikaRef != null;

  // "tehnika_name" field.
  String? _tehnikaName;
  String get tehnikaName => _tehnikaName ?? '';
  bool hasTehnikaName() => _tehnikaName != null;

  // "driver_name" field.
  String? _driverName;
  String get driverName => _driverName ?? '';
  bool hasDriverName() => _driverName != null;

  // "driver_ref" field.
  DocumentReference? _driverRef;
  DocumentReference? get driverRef => _driverRef;
  bool hasDriverRef() => _driverRef != null;

  // "aktiv" field.
  bool? _aktiv;
  bool get aktiv => _aktiv ?? false;
  bool hasAktiv() => _aktiv != null;

  // "gos_nomer" field.
  String? _gosNomer;
  String get gosNomer => _gosNomer ?? '';
  bool hasGosNomer() => _gosNomer != null;

  // "chat_ref" field.
  DocumentReference? _chatRef;
  DocumentReference? get chatRef => _chatRef;
  bool hasChatRef() => _chatRef != null;

  // "dop_ref" field.
  List<DocumentReference>? _dopRef;
  List<DocumentReference> get dopRef => _dopRef ?? const [];
  bool hasDopRef() => _dopRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdTime = snapshotData['created_time'] as DateTime?;
    _textOffer = snapshotData['text_offer'] as String?;
    _priceOffer = castToType<int>(snapshotData['price_offer']);
    _userOffer = snapshotData['user_offer'] as DocumentReference?;
    _isWin = snapshotData['is_win'] as bool?;
    _nameCompany = snapshotData['name_company'] as String?;
    _tehnikaRef = snapshotData['tehnika_ref'] as DocumentReference?;
    _tehnikaName = snapshotData['tehnika_name'] as String?;
    _driverName = snapshotData['driver_name'] as String?;
    _driverRef = snapshotData['driver_ref'] as DocumentReference?;
    _aktiv = snapshotData['aktiv'] as bool?;
    _gosNomer = snapshotData['gos_nomer'] as String?;
    _chatRef = snapshotData['chat_ref'] as DocumentReference?;
    _dopRef = getDataList(snapshotData['dop_ref']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('offers')
          : FirebaseFirestore.instance.collectionGroup('offers');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('offers').doc(id);

  static Stream<OffersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OffersRecord.fromSnapshot(s));

  static Future<OffersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OffersRecord.fromSnapshot(s));

  static OffersRecord fromSnapshot(DocumentSnapshot snapshot) => OffersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OffersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OffersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OffersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OffersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOffersRecordData({
  DateTime? createdTime,
  String? textOffer,
  int? priceOffer,
  DocumentReference? userOffer,
  bool? isWin,
  String? nameCompany,
  DocumentReference? tehnikaRef,
  String? tehnikaName,
  String? driverName,
  DocumentReference? driverRef,
  bool? aktiv,
  String? gosNomer,
  DocumentReference? chatRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'created_time': createdTime,
      'text_offer': textOffer,
      'price_offer': priceOffer,
      'user_offer': userOffer,
      'is_win': isWin,
      'name_company': nameCompany,
      'tehnika_ref': tehnikaRef,
      'tehnika_name': tehnikaName,
      'driver_name': driverName,
      'driver_ref': driverRef,
      'aktiv': aktiv,
      'gos_nomer': gosNomer,
      'chat_ref': chatRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class OffersRecordDocumentEquality implements Equality<OffersRecord> {
  const OffersRecordDocumentEquality();

  @override
  bool equals(OffersRecord? e1, OffersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createdTime == e2?.createdTime &&
        e1?.textOffer == e2?.textOffer &&
        e1?.priceOffer == e2?.priceOffer &&
        e1?.userOffer == e2?.userOffer &&
        e1?.isWin == e2?.isWin &&
        e1?.nameCompany == e2?.nameCompany &&
        e1?.tehnikaRef == e2?.tehnikaRef &&
        e1?.tehnikaName == e2?.tehnikaName &&
        e1?.driverName == e2?.driverName &&
        e1?.driverRef == e2?.driverRef &&
        e1?.aktiv == e2?.aktiv &&
        e1?.gosNomer == e2?.gosNomer &&
        e1?.chatRef == e2?.chatRef &&
        listEquality.equals(e1?.dopRef, e2?.dopRef);
  }

  @override
  int hash(OffersRecord? e) => const ListEquality().hash([
        e?.createdTime,
        e?.textOffer,
        e?.priceOffer,
        e?.userOffer,
        e?.isWin,
        e?.nameCompany,
        e?.tehnikaRef,
        e?.tehnikaName,
        e?.driverName,
        e?.driverRef,
        e?.aktiv,
        e?.gosNomer,
        e?.chatRef,
        e?.dopRef
      ]);

  @override
  bool isValidKey(Object? o) => o is OffersRecord;
}
