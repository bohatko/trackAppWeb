import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "users_ref" field.
  List<DocumentReference>? _usersRef;
  List<DocumentReference> get usersRef => _usersRef ?? const [];
  bool hasUsersRef() => _usersRef != null;

  // "chat_number" field.
  int? _chatNumber;
  int get chatNumber => _chatNumber ?? 0;
  bool hasChatNumber() => _chatNumber != null;

  // "order_ref" field.
  DocumentReference? _orderRef;
  DocumentReference? get orderRef => _orderRef;
  bool hasOrderRef() => _orderRef != null;

  // "message" field.
  List<MessageStruct>? _message;
  List<MessageStruct> get message => _message ?? const [];
  bool hasMessage() => _message != null;

  void _initializeFields() {
    _active = snapshotData['active'] as bool?;
    _usersRef = getDataList(snapshotData['users_ref']);
    _chatNumber = castToType<int>(snapshotData['chat_number']);
    _orderRef = snapshotData['order_ref'] as DocumentReference?;
    _message = getStructList(
      snapshotData['message'],
      MessageStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  bool? active,
  int? chatNumber,
  DocumentReference? orderRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'active': active,
      'chat_number': chatNumber,
      'order_ref': orderRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.active == e2?.active &&
        listEquality.equals(e1?.usersRef, e2?.usersRef) &&
        e1?.chatNumber == e2?.chatNumber &&
        e1?.orderRef == e2?.orderRef &&
        listEquality.equals(e1?.message, e2?.message);
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality()
      .hash([e?.active, e?.usersRef, e?.chatNumber, e?.orderRef, e?.message]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
