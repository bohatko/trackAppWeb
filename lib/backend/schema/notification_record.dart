import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "isRead" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  // "Sender" field.
  String? _sender;
  String get sender => _sender ?? '';
  bool hasSender() => _sender != null;

  // "header" field.
  String? _header;
  String get header => _header ?? '';
  bool hasHeader() => _header != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "public" field.
  bool? _public;
  bool get public => _public ?? false;
  bool hasPublic() => _public != null;

  // "chat_ref" field.
  DocumentReference? _chatRef;
  DocumentReference? get chatRef => _chatRef;
  bool hasChatRef() => _chatRef != null;

  void _initializeFields() {
    _message = snapshotData['message'] as String?;
    _time = snapshotData['time'] as DateTime?;
    _isRead = snapshotData['isRead'] as bool?;
    _sender = snapshotData['Sender'] as String?;
    _header = snapshotData['header'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _public = snapshotData['public'] as bool?;
    _chatRef = snapshotData['chat_ref'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notification');

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  String? message,
  DateTime? time,
  bool? isRead,
  String? sender,
  String? header,
  DocumentReference? userRef,
  bool? public,
  DocumentReference? chatRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'message': message,
      'time': time,
      'isRead': isRead,
      'Sender': sender,
      'header': header,
      'user_ref': userRef,
      'public': public,
      'chat_ref': chatRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.message == e2?.message &&
        e1?.time == e2?.time &&
        e1?.isRead == e2?.isRead &&
        e1?.sender == e2?.sender &&
        e1?.header == e2?.header &&
        e1?.userRef == e2?.userRef &&
        e1?.public == e2?.public &&
        e1?.chatRef == e2?.chatRef;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality().hash([
        e?.message,
        e?.time,
        e?.isRead,
        e?.sender,
        e?.header,
        e?.userRef,
        e?.public,
        e?.chatRef
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
