import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/document_componet_widget.dart';
import '/components/order_card_widget.dart';
import '/components/timelaps_widget.dart';
import '/components/timeline2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_detail_z_model.dart';
export 'order_detail_z_model.dart';

class OrderDetailZWidget extends StatefulWidget {
  const OrderDetailZWidget({
    super.key,
    required this.orderRef,
  });

  final DocumentReference? orderRef;

  static String routeName = 'Order_detail_z';
  static String routePath = 'orderDetailZ';

  @override
  State<OrderDetailZWidget> createState() => _OrderDetailZWidgetState();
}

class _OrderDetailZWidgetState extends State<OrderDetailZWidget> {
  late OrderDetailZModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderDetailZModel());

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

        final orderDetailZOrdersRecord = snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: PopScope(
            canPop: false,
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
                                adresOrder: orderDetailZOrdersRecord.location,
                                priceOrder: orderDetailZOrdersRecord.orderPrice,
                                discriptionOrder:
                                    orderDetailZOrdersRecord.description,
                                numberOrder:
                                    orderDetailZOrdersRecord.orderNumber,
                                budgetOrder: orderDetailZOrdersRecord
                                    .orderPriceMinusNacenka
                                    .toString(),
                                tehnikaOrder:
                                    orderDetailZOrdersRecord.typeTehnik,
                                statusOrder:
                                    orderDetailZOrdersRecord.orderStatus,
                                datettimeOrder:
                                    orderDetailZOrdersRecord.startTime!,
                                orderGeo: orderDetailZOrdersRecord.orderGeo!,
                                driverGeo: orderDetailZOrdersRecord.draverGeo,
                                dopOborud: orderDetailZOrdersRecord.dopOborud,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  12.0, 20.0, 12.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
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
                        if ((orderDetailZOrdersRecord.orderStatus !=
                                'Завершён') &&
                            (orderDetailZOrdersRecord.workFlow < 2))
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                context.pushNamed(
                                  ChatPageWidget.routeName,
                                  queryParameters: {
                                    'chatRef': serializeParam(
                                      orderDetailZOrdersRecord.chatWithZak,
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
                                      font: GoogleFonts.roboto(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
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
                                  date: orderDetailZOrdersRecord.timeCreated!,
                                  header: 'Заказ создан!',
                                  message: 'Подбираем технику..',
                                  icon: Icon(
                                    Icons.not_started_outlined,
                                    color: FlutterFlowTheme.of(context).primary,
                                    size: 24.0,
                                  ),
                                  color: FlutterFlowTheme.of(context).primary,
                                ),
                              ),
                              if (orderDetailZOrdersRecord.orderStatus !=
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
                                        timeCreated: orderDetailZOrdersRecord
                                            .lastEdited!,
                                        mess:
                                            'Техника на заказ найдена. Скачайте счёт на оплату',
                                        text1: 'Заказ в работе!',
                                      ),
                                    ),
                                  ),
                                ),
                              if (orderDetailZOrdersRecord.orderStatus !=
                                  'Новый')
                                wrapWithModel(
                                  model: _model.documentComponetModel1,
                                  updateCallback: () => safeSetState(() {}),
                                  child: DocumentComponetWidget(
                                    name: 'Счёт на оплату',
                                    action: () async {
                                      _model.docss44 =
                                          await queryDocsRecordOnce(
                                        parent: widget!.orderRef,
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      await actions.downloadFile(
                                        _model.docss44!.docSchet,
                                      );

                                      safeSetState(() {});
                                    },
                                  ),
                                ),
                              if ((orderDetailZOrdersRecord.orderStatus !=
                                      'Новый') &&
                                  (orderDetailZOrdersRecord.workFlow >= 0))
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.timelapsModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: TimelapsWidget(
                                        timeCreated: orderDetailZOrdersRecord
                                            .lastEdited!,
                                        mess:
                                            'Отслеживайте местоположение водителя на карте!',
                                        text1: 'Водитель начал работу!',
                                      ),
                                    ),
                                  ),
                                ),
                              if ((orderDetailZOrdersRecord.orderStatus !=
                                      'Новый') &&
                                  (orderDetailZOrdersRecord.workFlow > 1))
                                Align(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 8.0, 0.0, 0.0),
                                    child: wrapWithModel(
                                      model: _model.timelapsModel3,
                                      updateCallback: () => safeSetState(() {}),
                                      child: TimelapsWidget(
                                        timeCreated: orderDetailZOrdersRecord
                                            .lastEdited!,
                                        mess:
                                            'Водитель завершил заказ! Проверте корректность работы и если все хорошо - нажмите: \"Принять работу\"',
                                        text1: 'Водитель закончил работу!',
                                      ),
                                    ),
                                  ),
                                ),
                              if ((orderDetailZOrdersRecord.orderStatus !=
                                      'Новый') &&
                                  (orderDetailZOrdersRecord.workFlow > 1) &&
                                  (orderDetailZOrdersRecord.orderStatus !=
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
                                        _model.docss =
                                            await queryDocsRecordOnce(
                                          parent: widget!.orderRef,
                                          singleRecord: true,
                                        ).then((s) => s.firstOrNull);
                                        await actions.downloadFile(
                                          _model.docss!.docEsm7,
                                        );

                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              if ((orderDetailZOrdersRecord.orderStatus ==
                                      'В работе') &&
                                  (orderDetailZOrdersRecord.workFlow > 1))
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
                                                        child: Text(
                                                            'Подтверждаю!'),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ) ??
                                              false;
                                      if (confirmDialogResponse) {
                                        await orderDetailZOrdersRecord.reference
                                            .update(createOrdersRecordData(
                                          lastEdited: getCurrentTimestamp,
                                        ));
                                        _model.work = true;
                                        safeSetState(() {});
                                      }
                                    },
                                    text: 'Принять работу',
                                    options: FFButtonOptions(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height: 35.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 12.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            font: GoogleFonts.roboto(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .fontStyle,
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
                              if (orderDetailZOrdersRecord.orderStatus ==
                                  'Завершён')
                                wrapWithModel(
                                  model: _model.timeline2Model2,
                                  updateCallback: () => safeSetState(() {}),
                                  child: Timeline2Widget(
                                    date: orderDetailZOrdersRecord.lastEdited!,
                                    header: 'Заказ завершён',
                                    message: 'Спасибо, что выбрали нас!',
                                    icon: Icon(
                                      Icons.flag_sharp,
                                      color:
                                          FlutterFlowTheme.of(context).success,
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
          ),
        );
      },
    );
  }
}
