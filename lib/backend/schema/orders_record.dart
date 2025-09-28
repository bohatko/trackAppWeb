import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "last_edited" field.
  DateTime? _lastEdited;
  DateTime? get lastEdited => _lastEdited;
  bool hasLastEdited() => _lastEdited != null;

  // "time_created" field.
  DateTime? _timeCreated;
  DateTime? get timeCreated => _timeCreated;
  bool hasTimeCreated() => _timeCreated != null;

  // "order_number" field.
  int? _orderNumber;
  int get orderNumber => _orderNumber ?? 0;
  bool hasOrderNumber() => _orderNumber != null;

  // "order_price" field.
  int? _orderPrice;
  int get orderPrice => _orderPrice ?? 0;
  bool hasOrderPrice() => _orderPrice != null;

  // "order_status" field.
  String? _orderStatus;
  String get orderStatus => _orderStatus ?? '';
  bool hasOrderStatus() => _orderStatus != null;

  // "start_time" field.
  DateTime? _startTime;
  DateTime? get startTime => _startTime;
  bool hasStartTime() => _startTime != null;

  // "number_otvets" field.
  String? _numberOtvets;
  String get numberOtvets => _numberOtvets ?? '';
  bool hasNumberOtvets() => _numberOtvets != null;

  // "need_doc" field.
  bool? _needDoc;
  bool get needDoc => _needDoc ?? false;
  bool hasNeedDoc() => _needDoc != null;

  // "type_tehnik" field.
  String? _typeTehnik;
  String get typeTehnik => _typeTehnik ?? '';
  bool hasTypeTehnik() => _typeTehnik != null;

  // "driver" field.
  DocumentReference? _driver;
  DocumentReference? get driver => _driver;
  bool hasDriver() => _driver != null;

  // "work_flow" field.
  int? _workFlow;
  int get workFlow => _workFlow ?? 0;
  bool hasWorkFlow() => _workFlow != null;

  // "workp_pause" field.
  bool? _workpPause;
  bool get workpPause => _workpPause ?? false;
  bool hasWorkpPause() => _workpPause != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "list_user_zayavki" field.
  List<DocumentReference>? _listUserZayavki;
  List<DocumentReference> get listUserZayavki => _listUserZayavki ?? const [];
  bool hasListUserZayavki() => _listUserZayavki != null;

  // "tehnika_na_zakaz" field.
  String? _tehnikaNaZakaz;
  String get tehnikaNaZakaz => _tehnikaNaZakaz ?? '';
  bool hasTehnikaNaZakaz() => _tehnikaNaZakaz != null;

  // "company_ref" field.
  DocumentReference? _companyRef;
  DocumentReference? get companyRef => _companyRef;
  bool hasCompanyRef() => _companyRef != null;

  // "duraction_time" field.
  String? _duractionTime;
  String get duractionTime => _duractionTime ?? '';
  bool hasDuractionTime() => _duractionTime != null;

  // "nacenka" field.
  double? _nacenka;
  double get nacenka => _nacenka ?? 0.0;
  bool hasNacenka() => _nacenka != null;

  // "chat_with_zak" field.
  DocumentReference? _chatWithZak;
  DocumentReference? get chatWithZak => _chatWithZak;
  bool hasChatWithZak() => _chatWithZak != null;

  // "duration_smen" field.
  int? _durationSmen;
  int get durationSmen => _durationSmen ?? 0;
  bool hasDurationSmen() => _durationSmen != null;

  // "manager" field.
  DocumentReference? _manager;
  DocumentReference? get manager => _manager;
  bool hasManager() => _manager != null;

  // "order_price_minus_nacenka" field.
  int? _orderPriceMinusNacenka;
  int get orderPriceMinusNacenka => _orderPriceMinusNacenka ?? 0;
  bool hasOrderPriceMinusNacenka() => _orderPriceMinusNacenka != null;

  // "draver_geo" field.
  LatLng? _draverGeo;
  LatLng? get draverGeo => _draverGeo;
  bool hasDraverGeo() => _draverGeo != null;

  // "work_time" field.
  List<int>? _workTime;
  List<int> get workTime => _workTime ?? const [];
  bool hasWorkTime() => _workTime != null;

  // "order_geo" field.
  LatLng? _orderGeo;
  LatLng? get orderGeo => _orderGeo;
  bool hasOrderGeo() => _orderGeo != null;

  // "dop_oborud" field.
  List<String>? _dopOborud;
  List<String> get dopOborud => _dopOborud ?? const [];
  bool hasDopOborud() => _dopOborud != null;

  // "list_arenda" field.
  List<SelectedDopStruct>? _listArenda;
  List<SelectedDopStruct> get listArenda => _listArenda ?? const [];
  bool hasListArenda() => _listArenda != null;

  // "order_hours" field.
  String? _orderHours;
  String get orderHours => _orderHours ?? '';
  bool hasOrderHours() => _orderHours != null;

  // "user_ispolnitel_name" field.
  String? _userIspolnitelName;
  String get userIspolnitelName => _userIspolnitelName ?? '';
  bool hasUserIspolnitelName() => _userIspolnitelName != null;

  void _initializeFields() {
    _owner = snapshotData['owner'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _lastEdited = snapshotData['last_edited'] as DateTime?;
    _timeCreated = snapshotData['time_created'] as DateTime?;
    _orderNumber = castToType<int>(snapshotData['order_number']);
    _orderPrice = castToType<int>(snapshotData['order_price']);
    _orderStatus = snapshotData['order_status'] as String?;
    _startTime = snapshotData['start_time'] as DateTime?;
    _numberOtvets = snapshotData['number_otvets'] as String?;
    _needDoc = snapshotData['need_doc'] as bool?;
    _typeTehnik = snapshotData['type_tehnik'] as String?;
    _driver = snapshotData['driver'] as DocumentReference?;
    _workFlow = castToType<int>(snapshotData['work_flow']);
    _workpPause = snapshotData['workp_pause'] as bool?;
    _location = snapshotData['location'] as String?;
    _listUserZayavki = getDataList(snapshotData['list_user_zayavki']);
    _tehnikaNaZakaz = snapshotData['tehnika_na_zakaz'] as String?;
    _companyRef = snapshotData['company_ref'] as DocumentReference?;
    _duractionTime = snapshotData['duraction_time'] as String?;
    _nacenka = castToType<double>(snapshotData['nacenka']);
    _chatWithZak = snapshotData['chat_with_zak'] as DocumentReference?;
    _durationSmen = castToType<int>(snapshotData['duration_smen']);
    _manager = snapshotData['manager'] as DocumentReference?;
    _orderPriceMinusNacenka =
        castToType<int>(snapshotData['order_price_minus_nacenka']);
    _draverGeo = snapshotData['draver_geo'] as LatLng?;
    _workTime = getDataList(snapshotData['work_time']);
    _orderGeo = snapshotData['order_geo'] as LatLng?;
    _dopOborud = getDataList(snapshotData['dop_oborud']);
    _listArenda = getStructList(
      snapshotData['list_arenda'],
      SelectedDopStruct.fromMap,
    );
    _orderHours = snapshotData['order_hours'] as String?;
    _userIspolnitelName = snapshotData['user_ispolnitel_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  DocumentReference? owner,
  String? description,
  DateTime? lastEdited,
  DateTime? timeCreated,
  int? orderNumber,
  int? orderPrice,
  String? orderStatus,
  DateTime? startTime,
  String? numberOtvets,
  bool? needDoc,
  String? typeTehnik,
  DocumentReference? driver,
  int? workFlow,
  bool? workpPause,
  String? location,
  String? tehnikaNaZakaz,
  DocumentReference? companyRef,
  String? duractionTime,
  double? nacenka,
  DocumentReference? chatWithZak,
  int? durationSmen,
  DocumentReference? manager,
  int? orderPriceMinusNacenka,
  LatLng? draverGeo,
  LatLng? orderGeo,
  String? orderHours,
  String? userIspolnitelName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner': owner,
      'description': description,
      'last_edited': lastEdited,
      'time_created': timeCreated,
      'order_number': orderNumber,
      'order_price': orderPrice,
      'order_status': orderStatus,
      'start_time': startTime,
      'number_otvets': numberOtvets,
      'need_doc': needDoc,
      'type_tehnik': typeTehnik,
      'driver': driver,
      'work_flow': workFlow,
      'workp_pause': workpPause,
      'location': location,
      'tehnika_na_zakaz': tehnikaNaZakaz,
      'company_ref': companyRef,
      'duraction_time': duractionTime,
      'nacenka': nacenka,
      'chat_with_zak': chatWithZak,
      'duration_smen': durationSmen,
      'manager': manager,
      'order_price_minus_nacenka': orderPriceMinusNacenka,
      'draver_geo': draverGeo,
      'order_geo': orderGeo,
      'order_hours': orderHours,
      'user_ispolnitel_name': userIspolnitelName,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.owner == e2?.owner &&
        e1?.description == e2?.description &&
        e1?.lastEdited == e2?.lastEdited &&
        e1?.timeCreated == e2?.timeCreated &&
        e1?.orderNumber == e2?.orderNumber &&
        e1?.orderPrice == e2?.orderPrice &&
        e1?.orderStatus == e2?.orderStatus &&
        e1?.startTime == e2?.startTime &&
        e1?.numberOtvets == e2?.numberOtvets &&
        e1?.needDoc == e2?.needDoc &&
        e1?.typeTehnik == e2?.typeTehnik &&
        e1?.driver == e2?.driver &&
        e1?.workFlow == e2?.workFlow &&
        e1?.workpPause == e2?.workpPause &&
        e1?.location == e2?.location &&
        listEquality.equals(e1?.listUserZayavki, e2?.listUserZayavki) &&
        e1?.tehnikaNaZakaz == e2?.tehnikaNaZakaz &&
        e1?.companyRef == e2?.companyRef &&
        e1?.duractionTime == e2?.duractionTime &&
        e1?.nacenka == e2?.nacenka &&
        e1?.chatWithZak == e2?.chatWithZak &&
        e1?.durationSmen == e2?.durationSmen &&
        e1?.manager == e2?.manager &&
        e1?.orderPriceMinusNacenka == e2?.orderPriceMinusNacenka &&
        e1?.draverGeo == e2?.draverGeo &&
        listEquality.equals(e1?.workTime, e2?.workTime) &&
        e1?.orderGeo == e2?.orderGeo &&
        listEquality.equals(e1?.dopOborud, e2?.dopOborud) &&
        listEquality.equals(e1?.listArenda, e2?.listArenda) &&
        e1?.orderHours == e2?.orderHours &&
        e1?.userIspolnitelName == e2?.userIspolnitelName;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.owner,
        e?.description,
        e?.lastEdited,
        e?.timeCreated,
        e?.orderNumber,
        e?.orderPrice,
        e?.orderStatus,
        e?.startTime,
        e?.numberOtvets,
        e?.needDoc,
        e?.typeTehnik,
        e?.driver,
        e?.workFlow,
        e?.workpPause,
        e?.location,
        e?.listUserZayavki,
        e?.tehnikaNaZakaz,
        e?.companyRef,
        e?.duractionTime,
        e?.nacenka,
        e?.chatWithZak,
        e?.durationSmen,
        e?.manager,
        e?.orderPriceMinusNacenka,
        e?.draverGeo,
        e?.workTime,
        e?.orderGeo,
        e?.dopOborud,
        e?.listArenda,
        e?.orderHours,
        e?.userIspolnitelName
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
