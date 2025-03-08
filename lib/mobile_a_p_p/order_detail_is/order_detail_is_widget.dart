import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/components/document_componet_widget.dart';
import '/components/order_card_widget.dart';
import '/components/timelaps_widget.dart';
import '/components/timeline2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_detail_is_model.dart';
export 'order_detail_is_model.dart';

class OrderDetailIsWidget extends StatefulWidget {
  const OrderDetailIsWidget({
    super.key,
    required this.orderRef,
  });

  final DocumentReference? orderRef;

  static String routeName = 'Order_detail_is';
  static String routePath = 'orderDetailIs';

  @override
  State<OrderDetailIsWidget> createState() => _OrderDetailIsWidgetState();
}

class _OrderDetailIsWidgetState extends State<OrderDetailIsWidget> {
  late OrderDetailIsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderDetailIsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OrdersRecord>(
      stream: OrdersRecord.getDocument(widget!.orderRef!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: SpinKitCircle(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 30.0,
                ),
              ),
            ),
          );
        }

        final orderDetailIsOrdersRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: SafeArea(
              top: true,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 500.0,
                ),
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          wrapWithModel(
                            model: _model.orderCardModel,
                            updateCallback: () => safeSetState(() {}),
                            child: OrderCardWidget(
                              adresOrder: orderDetailIsOrdersRecord.location,
                              priceOrder: orderDetailIsOrdersRecord.orderPrice,
                              discriptionOrder:
                                  orderDetailIsOrdersRecord.description,
                              numberOrder:
                                  orderDetailIsOrdersRecord.orderNumber,
                              budgetOrder: orderDetailIsOrdersRecord
                                  .orderPriceMinusNacenka
                                  .toString(),
                              tehnikaOrder:
                                  orderDetailIsOrdersRecord.typeTehnik,
                              statusOrder:
                                  orderDetailIsOrdersRecord.orderStatus,
                              datettimeOrder:
                                  orderDetailIsOrdersRecord.startTime!,
                              orderGeo: orderDetailIsOrdersRecord.orderGeo!,
                              driverGeo: orderDetailIsOrdersRecord.draverGeo,
                              dopOborud: orderDetailIsOrdersRecord.dopOborud,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 20.0, 12.0, 8.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 50.0,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    context.pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      if ((orderDetailIsOrdersRecord.orderStatus !=
                              'Завершён') &&
                          (orderDetailIsOrdersRecord.workFlow < 2))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 12.0, 12.0, 12.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              context.pushNamed(
                                ChatPageWidget.routeName,
                                queryParameters: {
                                  'chatRef': serializeParam(
                                    orderDetailIsOrdersRecord.chatWithZak,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                                extra: <String, dynamic>{
                                  kTransitionInfoKey: TransitionInfo(
                                    hasTransition: true,
                                    transitionType: PageTransitionType.fade,
                                    duration: Duration(milliseconds: 0),
                                  ),
                                },
                              );
                            },
                            text: 'Чат по заказу',
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 35.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 0.0, 12.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primaryText,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 30.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            wrapWithModel(
                              model: _model.timeline2Model1,
                              updateCallback: () => safeSetState(() {}),
                              child: Timeline2Widget(
                                date: orderDetailIsOrdersRecord.timeCreated!,
                                header: 'Заказ создан!',
                                message: 'Выбираем исполнителя',
                                icon: Icon(
                                  Icons.not_started_outlined,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 24.0,
                                ),
                                color: FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                            if (orderDetailIsOrdersRecord.orderStatus !=
                                'Новый')
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.timelapsModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TimelapsWidget(
                                      timeCreated:
                                          orderDetailIsOrdersRecord.lastEdited!,
                                      mess:
                                          'Вас выбрали исполнителем заказа. Скачайте ЭСМ-2. Дайте водителю распоряжение на выполнение работ!',
                                      text1: 'Заказ в работе!',
                                    ),
                                  ),
                                ),
                              ),
                            if (orderDetailIsOrdersRecord.orderStatus !=
                                'Новый')
                              wrapWithModel(
                                model: _model.documentComponetModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: DocumentComponetWidget(
                                  name: 'ЭСМ-2',
                                  action: () async {
                                    _model.docss44 = await queryDocsRecordOnce(
                                      parent: widget!.orderRef,
                                      singleRecord: true,
                                    ).then((s) => s.firstOrNull);
                                    await actions.downloadFile(
                                      _model.docss44!.docEsm2,
                                    );

                                    safeSetState(() {});
                                  },
                                ),
                              ),
                            if ((orderDetailIsOrdersRecord.orderStatus !=
                                    'Новый') &&
                                (orderDetailIsOrdersRecord.workFlow >= 0))
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.timelapsModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TimelapsWidget(
                                      timeCreated:
                                          orderDetailIsOrdersRecord.lastEdited!,
                                      mess:
                                          'Отслеживайте местоположение водителя на карте!',
                                      text1: 'Водитель начал работу!',
                                    ),
                                  ),
                                ),
                              ),
                            if ((orderDetailIsOrdersRecord.orderStatus !=
                                    'Новый') &&
                                (orderDetailIsOrdersRecord.workFlow > 1))
                              Align(
                                alignment: AlignmentDirectional(0.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: wrapWithModel(
                                    model: _model.timelapsModel3,
                                    updateCallback: () => safeSetState(() {}),
                                    child: TimelapsWidget(
                                      timeCreated:
                                          orderDetailIsOrdersRecord.lastEdited!,
                                      mess:
                                          'Водитель завершил заказ! Проверте корректность работы и если нет претензий  - нажмите: \"Принять работу\"',
                                      text1: 'Водитель закончил работу!',
                                    ),
                                  ),
                                ),
                              ),
                            if ((orderDetailIsOrdersRecord.orderStatus !=
                                    'Новый') &&
                                (orderDetailIsOrdersRecord.workFlow > 1) &&
                                (orderDetailIsOrdersRecord.orderStatus !=
                                    'В работе'))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 0.0),
                                child: wrapWithModel(
                                  model: _model.documentComponetModel2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: DocumentComponetWidget(
                                    name: 'ЭСМ-7',
                                    action: () async {
                                      _model.docss = await queryDocsRecordOnce(
                                        parent: widget!.orderRef,
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      await actions.downloadFile(
                                        _model.docss!.docEsm7Isp,
                                      );

                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              ),
                            if ((orderDetailIsOrdersRecord.orderStatus ==
                                    'В работе') &&
                                (orderDetailIsOrdersRecord.workFlow > 1))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 12.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    var confirmDialogResponse =
                                        await showDialog<bool>(
                                              context: context,
                                              builder: (alertDialogContext) {
                                                return AlertDialog(
                                                  title: Text('Вы уверены?'),
                                                  content: Text(
                                                      'Действие необратимо! Заказ будет окончательно закрыт!'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              false),
                                                      child: Text('Отмена'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext,
                                                              true),
                                                      child:
                                                          Text('Подтверждаю!'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ) ??
                                            false;
                                    if (confirmDialogResponse) {
                                      unawaited(
                                        () async {
                                          await orderDetailIsOrdersRecord
                                              .reference
                                              .update(createOrdersRecordData(
                                            lastEdited: getCurrentTimestamp,
                                            orderStatus: 'Завершён',
                                          ));
                                        }(),
                                      );
                                      _model.work = true;
                                      safeSetState(() {});
                                      _model.offer =
                                          await queryOffersRecordOnce(
                                        parent:
                                            orderDetailIsOrdersRecord.reference,
                                        queryBuilder: (offersRecord) =>
                                            offersRecord.where(
                                          'user_offer',
                                          isEqualTo: currentUserReference,
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _model.collDoxs =
                                          await queryDocsRecordOnce(
                                        parent:
                                            orderDetailIsOrdersRecord.reference,
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _model.esmIsp =
                                          await queryDocumentsRecordOnce(
                                        queryBuilder: (documentsRecord) =>
                                            documentsRecord.where(
                                          'name',
                                          isEqualTo: 'ЭСМ-7 (исполнитель)',
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _model.esm7Zak =
                                          await queryDocumentsRecordOnce(
                                        queryBuilder: (documentsRecord) =>
                                            documentsRecord.where(
                                          'name',
                                          isEqualTo: 'ЭСМ-7 (заказчик)',
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _model.compIsp =
                                          await queryCompanyRecordOnce(
                                        parent: currentUserReference,
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _model.comZak =
                                          await queryCompanyRecordOnce(
                                        parent: orderDetailIsOrdersRecord.owner,
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      await Future.wait([
                                        Future(() async {
                                          try {
                                            final result = await FirebaseFunctions
                                                    .instanceFor(
                                                        region:
                                                            'europe-central2')
                                                .httpsCallable(
                                                    'simpleReplaceInDocx')
                                                .call({
                                              "orderNumber":
                                                  orderDetailIsOrdersRecord
                                                      .orderNumber
                                                      .toString(),
                                              "city": 'Москва',
                                              "date": dateTimeFormat(
                                                "yMMMd",
                                                getCurrentTimestamp,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              "companynameIsp":
                                                  _model.offer?.nameCompany,
                                              "companynameZak":
                                                  'ООО \" ТРЭКАП\"',
                                              "docxTemplateUrl":
                                                  _model.esmIsp?.link,
                                              "companyadresIsp":
                                                  _model.compIsp?.companyAdress,
                                              "innIsp":
                                                  _model.compIsp?.companyInn,
                                              "kppIsp":
                                                  _model.compIsp?.companyKpp,
                                              "ogrnIsp":
                                                  _model.compIsp?.companyOrgn,
                                              "rsIsp":
                                                  _model.compIsp?.companyRs,
                                              "ksIsp":
                                                  _model.compIsp?.companyKs,
                                              "bikIsp":
                                                  _model.compIsp?.companyBik,
                                              "tsIsp": 'Na',
                                              "orderprice": (int.parse(
                                                          orderDetailIsOrdersRecord
                                                              .orderPrice
                                                              .toString()) -
                                                      int.parse(
                                                              orderDetailIsOrdersRecord
                                                                  .orderPrice
                                                                  .toString()) *
                                                          20 /
                                                          120)
                                                  .toString(),
                                              "adressRabot":
                                                  orderDetailIsOrdersRecord
                                                      .location,
                                              "companyAdresZak": 'Москва',
                                              "innZak": '9709109357',
                                              "kppZak": '770901001',
                                              "ogrnZak": 'Null',
                                              "rsZak": '40702810124790003930',
                                              "ksZak": '30101810145250000411',
                                              "bikZak": '044525411',
                                              "fioDirZak": 'Фадеев А.А',
                                              "fioDirIsp":
                                                  _model.compIsp?.gendir,
                                              "qsmen": orderDetailIsOrdersRecord
                                                  .durationSmen
                                                  .toString(),
                                              "startOrder": dateTimeFormat(
                                                "yMMMd",
                                                orderDetailIsOrdersRecord
                                                    .startTime,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              "bankZak":
                                                  'ФИЛИАЛ \"ЦЕНТРАЛЬНЫЙ\" БАНКА ВТБ (ПАО)',
                                              "rateHour": (orderDetailIsOrdersRecord
                                                          .orderPrice ~/
                                                      int.parse(
                                                          orderDetailIsOrdersRecord
                                                              .duractionTime))
                                                  .toString(),
                                              "companyOKPOZak": 'NA',
                                              "companyOKPOIsp": 'NA',
                                              "phoneNumberZAk": '+79774095790',
                                              "markTehnik":
                                                  _model.offer?.tehnikaName,
                                              "gosnumber":
                                                  _model.offer?.gosNomer,
                                              "hoursINSmena":
                                                  orderDetailIsOrdersRecord
                                                      .orderHours,
                                              "voditelName":
                                                  _model.offer?.driverName,
                                              "nds": (int.parse(
                                                          orderDetailIsOrdersRecord
                                                              .orderPrice
                                                              .toString()) *
                                                      20 /
                                                      120)
                                                  .toString(),
                                              "summNds":
                                                  orderDetailIsOrdersRecord
                                                      .orderPrice
                                                      .toString(),
                                              "priceOborudov":
                                                  ((List<int> var1) {
                                                return var1
                                                    .reduce((a, b) => a + b);
                                              }(orderDetailIsOrdersRecord
                                                          .listArenda
                                                          .map((e) => e.rate)
                                                          .toList()))
                                                      .toString(),
                                            });
                                            _model.cfNewEsm7Isp =
                                                SimpleReplaceInDocxCloudFunctionCallResponse(
                                              data: result.data,
                                              succeeded: true,
                                              resultAsString:
                                                  result.data.toString(),
                                              jsonBody: result.data,
                                            );
                                          } on FirebaseFunctionsException catch (error) {
                                            _model.cfNewEsm7Isp =
                                                SimpleReplaceInDocxCloudFunctionCallResponse(
                                              errorCode: error.code,
                                              succeeded: false,
                                            );
                                          }
                                        }),
                                        Future(() async {
                                          try {
                                            final result = await FirebaseFunctions
                                                    .instanceFor(
                                                        region:
                                                            'europe-central2')
                                                .httpsCallable(
                                                    'simpleReplaceInDocx')
                                                .call({
                                              "orderNumber":
                                                  orderDetailIsOrdersRecord
                                                      .orderNumber
                                                      .toString(),
                                              "city": 'Москва',
                                              "date": dateTimeFormat(
                                                "yMMMd",
                                                getCurrentTimestamp,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              "companynameIsp":
                                                  'ООО \" ТРЭКАП\"',
                                              "companynameZak":
                                                  _model.comZak?.companyName,
                                              "docxTemplateUrl":
                                                  _model.esm7Zak?.link,
                                              "companyadresIsp":
                                                  'Москва, 109147 внутригородская территория (внутригородское муниципальное образование) города федерального значения муниципальный округ Таганский, ул. Марксистская, дом 20, строение 8, помещение 1/1',
                                              "innIsp": '9709109357',
                                              "kppIsp": '770901001',
                                              "ogrnIsp": 'NA',
                                              "rsIsp": '40702810124790003930',
                                              "ksIsp": '30101810145250000411',
                                              "bikIsp": '044525411',
                                              "tsIsp": 'NA',
                                              "orderprice": (int.parse(
                                                          orderDetailIsOrdersRecord
                                                              .orderPriceMinusNacenka
                                                              .toString()) -
                                                      int.parse(orderDetailIsOrdersRecord
                                                              .orderPriceMinusNacenka
                                                              .toString()) *
                                                          20 /
                                                          120)
                                                  .toString(),
                                              "adressRabot":
                                                  orderDetailIsOrdersRecord
                                                      .location,
                                              "companyAdresZak":
                                                  valueOrDefault<String>(
                                                _model.comZak?.companyAdress,
                                                'NA',
                                              ),
                                              "innZak":
                                                  _model.comZak?.companyInn,
                                              "kppZak":
                                                  _model.comZak?.companyKpp,
                                              "ogrnZak": valueOrDefault<String>(
                                                _model.comZak?.companyOrgn,
                                                'NA',
                                              ),
                                              "rsZak": valueOrDefault<String>(
                                                _model.comZak?.companyRs,
                                                'NA',
                                              ),
                                              "ksZak": '30101810145250000411',
                                              "bikZak": valueOrDefault<String>(
                                                _model.comZak?.companyBik,
                                                'NA',
                                              ),
                                              "fioDirZak":
                                                  valueOrDefault<String>(
                                                _model.comZak?.gendir,
                                                'NA',
                                              ),
                                              "fioDirIsp": 'Фадеев А. А.',
                                              "qsmen": orderDetailIsOrdersRecord
                                                  .durationSmen
                                                  .toString(),
                                              "startOrder": dateTimeFormat(
                                                "yMMMd",
                                                orderDetailIsOrdersRecord
                                                    .startTime,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              ),
                                              "bankZak": valueOrDefault<String>(
                                                _model.comZak?.companyBank,
                                                'NA',
                                              ),
                                              "rateHour": (orderDetailIsOrdersRecord
                                                          .orderPrice ~/
                                                      int.parse(
                                                          orderDetailIsOrdersRecord
                                                              .duractionTime))
                                                  .toString(),
                                              "companyOKPOZak":
                                                  valueOrDefault<String>(
                                                _model.comZak?.companyOkpo,
                                                'NA',
                                              ),
                                              "companyOKPOIsp": 'NA',
                                              "phoneNumberZAk":
                                                  orderDetailIsOrdersRecord
                                                      .numberOtvets,
                                              "markTehnik":
                                                  _model.offer?.tehnikaName,
                                              "gosnumber":
                                                  _model.offer?.gosNomer,
                                              "hoursINSmena":
                                                  orderDetailIsOrdersRecord
                                                      .orderHours,
                                              "voditelName":
                                                  _model.offer?.driverName,
                                              "nds": (int.parse(
                                                          orderDetailIsOrdersRecord
                                                              .orderPrice
                                                              .toString()) *
                                                      20 /
                                                      120)
                                                  .toString(),
                                              "summNds":
                                                  orderDetailIsOrdersRecord
                                                      .orderPriceMinusNacenka
                                                      .toString(),
                                              "priceOborudov":
                                                  ((List<int> var1) {
                                                return var1
                                                    .reduce((a, b) => a + b);
                                              }(orderDetailIsOrdersRecord
                                                          .listArenda
                                                          .map((e) => e.rate)
                                                          .toList()))
                                                      .toString(),
                                            });
                                            _model.cfNewEsm7Zak =
                                                SimpleReplaceInDocxCloudFunctionCallResponse(
                                              data: result.data,
                                              succeeded: true,
                                              resultAsString:
                                                  result.data.toString(),
                                              jsonBody: result.data,
                                            );
                                          } on FirebaseFunctionsException catch (error) {
                                            _model.cfNewEsm7Zak =
                                                SimpleReplaceInDocxCloudFunctionCallResponse(
                                              errorCode: error.code,
                                              succeeded: false,
                                            );
                                          }
                                        }),
                                      ]);
                                      await Future.delayed(
                                          const Duration(milliseconds: 500));

                                      await _model.collDoxs!.reference
                                          .update(createDocsRecordData(
                                        docEsm7Isp: getJsonField(
                                          _model.cfNewEsm7Isp?.jsonBody,
                                          r'''$.docxUrl''',
                                        ).toString(),
                                        docEsm7: getJsonField(
                                          _model.cfNewEsm7Zak?.jsonBody,
                                          r'''$.docxUrl''',
                                        ).toString(),
                                      ));
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Заказ отмечен как выполнен!',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 2000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .success,
                                        ),
                                      );
                                    }

                                    safeSetState(() {});
                                  },
                                  text: 'Подтвердить выполнение',
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 35.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 12.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            if (orderDetailIsOrdersRecord.orderStatus ==
                                'Завершён')
                              wrapWithModel(
                                model: _model.timeline2Model2,
                                updateCallback: () => safeSetState(() {}),
                                child: Timeline2Widget(
                                  date: orderDetailIsOrdersRecord.lastEdited!,
                                  header: 'Заказ завершён',
                                  message: 'Спасибо, что выбрали нас!',
                                  icon: Icon(
                                    Icons.flag_sharp,
                                    color: FlutterFlowTheme.of(context).success,
                                    size: 24.0,
                                  ),
                                  color: FlutterFlowTheme.of(context).success,
                                ),
                              ),
                          ].divide(SizedBox(height: 4.0)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
