import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/list_empty_driver_widget.dart';
import '/components/list_empty_tehnik_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'alert_add_offer_model.dart';
export 'alert_add_offer_model.dart';

class AlertAddOfferWidget extends StatefulWidget {
  const AlertAddOfferWidget({
    super.key,
    required this.orderDoc,
    this.number,
  });

  final OrdersRecord? orderDoc;
  final String? number;

  @override
  State<AlertAddOfferWidget> createState() => _AlertAddOfferWidgetState();
}

class _AlertAddOfferWidgetState extends State<AlertAddOfferWidget> {
  late AlertAddOfferModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertAddOfferModel());

    _model.predlozhenieTextController ??= TextEditingController();
    _model.predlozhenieFocusNode ??= FocusNode();

    _model.summOfferTextController ??= TextEditingController(
        text: valueOrDefault<String>(
      widget!.orderDoc?.orderPriceMinusNacenka?.toString(),
      '0',
    ));
    _model.summOfferFocusNode ??= FocusNode();
    _model.summOfferFocusNode!.addListener(() => safeSetState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Material(
        color: Colors.transparent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Container(
          width: 900.0,
          height: 800.0,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 12.0, 0.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 12.0, 0.0, 0.0),
                          child: Text(
                            'Ваше предложение',
                            style: FlutterFlowTheme.of(context)
                                .headlineMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).primary,
                        icon: Icon(
                          Icons.close_sharp,
                          color: FlutterFlowTheme.of(context).info,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: Text(
                            'Опишите Ваше предложение',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 8.0),
                          child: TextFormField(
                            controller: _model.predlozhenieTextController,
                            focusNode: _model.predlozhenieFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.predlozhenieTextController',
                              Duration(milliseconds: 100),
                              () => safeSetState(() {}),
                            ),
                            autofocus: false,
                            textCapitalization: TextCapitalization.sentences,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Roboto',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .newBorderColor,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              contentPadding: EdgeInsets.all(12.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  letterSpacing: 0.0,
                                ),
                            maxLines: 4,
                            maxLength: 275,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            validator: _model
                                .predlozhenieTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Text(
                                      'Техника для этого заказа',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: Container(
                                    width: 250.0,
                                    height: 300.0,
                                    decoration: BoxDecoration(),
                                    child: FutureBuilder<List<TehnikaRecord>>(
                                      future:
                                          (_model.firestoreRequestCompleter1 ??=
                                                  Completer<
                                                      List<TehnikaRecord>>()
                                                    ..complete(
                                                        queryTehnikaRecordOnce(
                                                      parent:
                                                          currentUserReference,
                                                      queryBuilder:
                                                          (tehnikaRecord) =>
                                                              tehnikaRecord
                                                                  .where(
                                                        'is_moderate',
                                                        isEqualTo: true,
                                                      ),
                                                    )))
                                              .future,
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 30.0,
                                              height: 30.0,
                                              child: SpinKitCircle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 30.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<TehnikaRecord>
                                            listViewTehnikaRecordList =
                                            snapshot.data!;
                                        if (listViewTehnikaRecordList.isEmpty) {
                                          return Container(
                                            height: 50.0,
                                            child: ListEmptyTehnikWidget(),
                                          );
                                        }

                                        return RefreshIndicator(
                                          onRefresh: () async {
                                            safeSetState(() => _model
                                                    .firestoreRequestCompleter1 =
                                                null);
                                            await _model
                                                .waitForFirestoreRequestCompleted1();
                                          },
                                          child: ListView.separated(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount: listViewTehnikaRecordList
                                                .length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 8.0),
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewTehnikaRecord =
                                                  listViewTehnikaRecordList[
                                                      listViewIndex];
                                              return Visibility(
                                                visible: listViewTehnikaRecord
                                                    .hasTehnikaRef(),
                                                child: FutureBuilder<
                                                    SpravochnikTekhnikaRecord>(
                                                  future: SpravochnikTekhnikaRecord
                                                      .getDocumentOnce(
                                                          listViewTehnikaRecord
                                                              .tehnikaRef!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 30.0,
                                                          height: 30.0,
                                                          child: SpinKitCircle(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 30.0,
                                                          ),
                                                        ),
                                                      );
                                                    }

                                                    final cardSpravochnikTekhnikaRecord =
                                                        snapshot.data!;

                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        _model.selectedTehnik =
                                                            cardSpravochnikTekhnikaRecord
                                                                .typeTehnik;
                                                        _model.selectedTehnikGosNomer =
                                                            listViewTehnikaRecord
                                                                .gosNumber;
                                                        _model.selectedTehnikRef =
                                                            listViewTehnikaRecord
                                                                .reference;
                                                        safeSetState(() {});
                                                      },
                                                      child: Card(
                                                        clipBehavior: Clip
                                                            .antiAliasWithSaveLayer,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        elevation: 0.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      6.0),
                                                        ),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6.0),
                                                            border: Border.all(
                                                              color: _model
                                                                          .selectedTehnik ==
                                                                      cardSpravochnikTekhnikaRecord
                                                                          .typeTehnik
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .newBorderColor,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8.0),
                                                                  child: Image
                                                                      .network(
                                                                    cardSpravochnikTekhnikaRecord
                                                                        .mainImage,
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        120.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    cardSpravochnikTekhnikaRecord
                                                                        .typeTehnik,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          12.0),
                                                                  child: Text(
                                                                    listViewTehnikaRecord
                                                                        .gosNumber,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Text(
                                      'Допоборудование для этого заказа',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: Container(
                                    width: 250.0,
                                    height: 300.0,
                                    decoration: BoxDecoration(),
                                    child: FutureBuilder<List<DopOborudRecord>>(
                                      future: (_model
                                                  .firestoreRequestCompleter3 ??=
                                              Completer<List<DopOborudRecord>>()
                                                ..complete(
                                                    queryDopOborudRecordOnce(
                                                  parent: currentUserReference,
                                                  queryBuilder:
                                                      (dopOborudRecord) =>
                                                          dopOborudRecord.where(
                                                    'status',
                                                    isEqualTo: true,
                                                  ),
                                                )))
                                          .future,
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 30.0,
                                              height: 30.0,
                                              child: SpinKitCircle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 30.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<DopOborudRecord>
                                            listViewDopOborudRecordList =
                                            snapshot.data!;
                                        if (listViewDopOborudRecordList
                                            .isEmpty) {
                                          return Container(
                                            height: 50.0,
                                            child: ListEmptyTehnikWidget(),
                                          );
                                        }

                                        return RefreshIndicator(
                                          onRefresh: () async {
                                            safeSetState(() => _model
                                                    .firestoreRequestCompleter3 =
                                                null);
                                            await _model
                                                .waitForFirestoreRequestCompleted3();
                                          },
                                          child: ListView.separated(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewDopOborudRecordList
                                                    .length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 8.0),
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewDopOborudRecord =
                                                  listViewDopOborudRecordList[
                                                      listViewIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if (_model.dopDocs.contains(
                                                          listViewDopOborudRecord
                                                              .reference) ==
                                                      false) {
                                                    _model.addToDopDocs(
                                                        listViewDopOborudRecord
                                                            .reference);
                                                    safeSetState(() {});
                                                  } else {
                                                    _model.removeFromDopDocs(
                                                        listViewDopOborudRecord
                                                            .reference);
                                                    safeSetState(() {});
                                                  }
                                                },
                                                child: Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  elevation: 0.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0),
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                      border: Border.all(
                                                        color: _model.dopDocs.contains(
                                                                listViewDopOborudRecord
                                                                    .reference)
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .newBorderColor,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              listViewDopOborudRecord
                                                                  .image,
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  1.0,
                                                              height: 120.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              listViewDopOborudRecord
                                                                  .name,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        12.0),
                                                            child: Text(
                                                              listViewDopOborudRecord
                                                                  .model,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 220.0,
                              child: VerticalDivider(
                                width: 1.0,
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: Text(
                                      'Водитель для этого заказа',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 12.0),
                                  child: Container(
                                    width: 200.0,
                                    height: 300.0,
                                    decoration: BoxDecoration(),
                                    child: FutureBuilder<List<UsersRecord>>(
                                      future:
                                          (_model.firestoreRequestCompleter2 ??=
                                                  Completer<List<UsersRecord>>()
                                                    ..complete(
                                                        queryUsersRecordOnce(
                                                      queryBuilder:
                                                          (usersRecord) =>
                                                              usersRecord.where(
                                                        'assigned_ispolnitel',
                                                        isEqualTo:
                                                            currentUserReference,
                                                      ),
                                                    )))
                                              .future,
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 30.0,
                                              height: 30.0,
                                              child: SpinKitCircle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 30.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<UsersRecord>
                                            listViewUsersRecordList =
                                            snapshot.data!;
                                        if (listViewUsersRecordList.isEmpty) {
                                          return Container(
                                            height: 50.0,
                                            child: ListEmptyDriverWidget(),
                                          );
                                        }

                                        return RefreshIndicator(
                                          onRefresh: () async {
                                            safeSetState(() => _model
                                                    .firestoreRequestCompleter2 =
                                                null);
                                            await _model
                                                .waitForFirestoreRequestCompleted2();
                                          },
                                          child: ListView.separated(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            itemCount:
                                                listViewUsersRecordList.length,
                                            separatorBuilder: (_, __) =>
                                                SizedBox(height: 8.0),
                                            itemBuilder:
                                                (context, listViewIndex) {
                                              final listViewUsersRecord =
                                                  listViewUsersRecordList[
                                                      listViewIndex];
                                              return InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.driverDisplayName =
                                                      listViewUsersRecord
                                                          .displayName;
                                                  _model.driverID =
                                                      listViewIndex;
                                                  _model.driverLastName =
                                                      listViewUsersRecord
                                                          .lastName;
                                                  safeSetState(() {});
                                                },
                                                child: Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  elevation: 0.0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.0),
                                                  ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.0),
                                                      border: Border.all(
                                                        color: _model
                                                                    .driverID ==
                                                                listViewIndex
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primary
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(8.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                listViewUsersRecord
                                                                    .photoUrl,
                                                                'https://firebasestorage.googleapis.com/v0/b/track-app-uxjczg.appspot.com/o/01.png?alt=media&token=1e4d125a-ef25-4922-ba69-a17c426acd6a',
                                                              ),
                                                              width: 170.0,
                                                              height: 200.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        4.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              listViewUsersRecord
                                                                  .displayName,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        12.0),
                                                            child: Text(
                                                              listViewUsersRecord
                                                                  .lastName,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Roboto',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ].divide(SizedBox(width: 24.0)),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 8.0),
                          child: Text(
                            'Сумма не может быть больше чем ${widget!.orderDoc?.orderPriceMinusNacenka?.toString()} рублей',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Roboto',
                                  color: functions.returnMaxSumm(
                                              widget!.orderDoc
                                                  ?.orderPriceMinusNacenka
                                                  ?.toString(),
                                              _model.summOfferTextController
                                                  .text) ==
                                          true
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context).error,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 200.0,
                              child: TextFormField(
                                controller: _model.summOfferTextController,
                                focusNode: _model.summOfferFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.summOfferTextController',
                                  Duration(milliseconds: 1000),
                                  () async {
                                    if (functions.returnMaxSumm(
                                            widget!.orderDoc
                                                ?.orderPriceMinusNacenka
                                                ?.toString(),
                                            _model.summOfferTextController
                                                .text) ==
                                        false) {
                                      safeSetState(() {
                                        _model.summOfferTextController?.text =
                                            widget!.orderDoc!
                                                .orderPriceMinusNacenka
                                                .toString();
                                        _model.summOfferFocusNode
                                            ?.requestFocus();
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          _model.summOfferTextController
                                                  ?.selection =
                                              TextSelection.collapsed(
                                            offset: _model
                                                .summOfferTextController!
                                                .text
                                                .length,
                                          );
                                        });
                                      });
                                    }
                                  },
                                ),
                                autofocus: false,
                                textCapitalization: TextCapitalization.none,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Стоимость',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .newBorderColor,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: functions.returnMaxSumm(
                                                  widget!.orderDoc
                                                      ?.orderPriceMinusNacenka
                                                      ?.toString(),
                                                  _model.summOfferTextController
                                                      .text) ==
                                              true
                                          ? FlutterFlowTheme.of(context)
                                              .lineColor
                                          : FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: functions.returnMaxSumm(
                                                  widget!.orderDoc
                                                      ?.orderPriceMinusNacenka
                                                      ?.toString(),
                                                  _model.summOfferTextController
                                                      .text) ==
                                              true
                                          ? FlutterFlowTheme.of(context)
                                              .lineColor
                                          : FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                    ),
                                maxLength: 9,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                buildCounter: (context,
                                        {required currentLength,
                                        required isFocused,
                                        maxLength}) =>
                                    null,
                                keyboardType: TextInputType.number,
                                validator: _model
                                    .summOfferTextControllerValidator
                                    .asValidator(context),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9]'))
                                ],
                              ),
                            ),
                            Icon(
                              Icons.currency_ruble,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 28.0,
                            ),
                          ],
                        ),
                      ),
                      Opacity(
                        opacity: (_model.summOfferTextController.text != null &&
                                    _model.summOfferTextController.text !=
                                        '') &&
                                (_model.predlozhenieTextController.text !=
                                        null &&
                                    _model.predlozhenieTextController.text !=
                                        '')
                            ? 1.0
                            : 0.5,
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              var _shouldSetState = false;
                              if ((_model.summOfferTextController.text !=
                                          null &&
                                      _model.summOfferTextController.text !=
                                          '') &&
                                  (_model.predlozhenieTextController.text !=
                                          null &&
                                      _model.predlozhenieTextController.text !=
                                          '') &&
                                  (_model.driverDisplayName != null &&
                                      _model.driverDisplayName != '') &&
                                  (_model.selectedTehnik != null &&
                                      _model.selectedTehnik != '')) {
                                unawaited(
                                  () async {
                                    await widget!.orderDoc!.reference.update({
                                      ...mapToFirestore(
                                        {
                                          'list_user_zayavki':
                                              FieldValue.arrayUnion(
                                                  [currentUserReference]),
                                        },
                                      ),
                                    });
                                  }(),
                                );
                                _model.driver = await queryUsersRecordOnce(
                                  queryBuilder: (usersRecord) => usersRecord
                                      .where(
                                        'assigned_ispolnitel',
                                        isEqualTo: currentUserReference,
                                      )
                                      .where(
                                        'display_name',
                                        isEqualTo: _model.driverDisplayName,
                                      ),
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                _shouldSetState = true;
                                _model.company = await queryCompanyRecordOnce(
                                  parent: currentUserReference,
                                  singleRecord: true,
                                ).then((s) => s.firstOrNull);
                                _shouldSetState = true;

                                var chatsRecordReference =
                                    ChatsRecord.collection.doc();
                                await chatsRecordReference.set({
                                  ...createChatsRecordData(
                                    active: true,
                                    chatNumber: random_data.randomInteger(
                                        100000, 999999999),
                                    orderRef: widget!.orderDoc?.reference,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'users_ref': [currentUserReference],
                                      'message': [
                                        getMessageFirestoreData(
                                          createMessageStruct(
                                            time: getCurrentTimestamp,
                                            text:
                                                'Здравствуйте! Мы на связи! Сейчас рассмотрим Ваш отклик и ответим Вам!',
                                            userRef: widget!.orderDoc?.manager,
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          true,
                                        )
                                      ],
                                    },
                                  ),
                                });
                                _model.chatOfer =
                                    ChatsRecord.getDocumentFromData({
                                  ...createChatsRecordData(
                                    active: true,
                                    chatNumber: random_data.randomInteger(
                                        100000, 999999999),
                                    orderRef: widget!.orderDoc?.reference,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'users_ref': [currentUserReference],
                                      'message': [
                                        getMessageFirestoreData(
                                          createMessageStruct(
                                            time: getCurrentTimestamp,
                                            text:
                                                'Здравствуйте! Мы на связи! Сейчас рассмотрим Ваш отклик и ответим Вам!',
                                            userRef: widget!.orderDoc?.manager,
                                            clearUnsetFields: false,
                                            create: true,
                                          ),
                                          true,
                                        )
                                      ],
                                    },
                                  ),
                                }, chatsRecordReference);
                                _shouldSetState = true;

                                var offersRecordReference =
                                    OffersRecord.createDoc(
                                        widget!.orderDoc!.reference);
                                await offersRecordReference.set({
                                  ...createOffersRecordData(
                                    createdTime: getCurrentTimestamp,
                                    textOffer:
                                        _model.predlozhenieTextController.text,
                                    priceOffer: int.tryParse(
                                        _model.summOfferTextController.text),
                                    userOffer: currentUserReference,
                                    tehnikaName: _model.selectedTehnik,
                                    aktiv: true,
                                    driverName: '${valueOrDefault<String>(
                                      _model.driver?.displayName,
                                      '00',
                                    )} ${valueOrDefault<String>(
                                      _model.driver?.lastName,
                                      '00',
                                    )}',
                                    nameCompany: _model.company?.companyName,
                                    tehnikaRef: _model.selectedTehnikRef,
                                    driverRef: _model.driver?.reference,
                                    gosNomer: _model.selectedTehnikGosNomer,
                                    chatRef: _model.chatOfer?.reference,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'dop_ref': _model.dopDocs,
                                    },
                                  ),
                                });
                                _model.newoffer2 =
                                    OffersRecord.getDocumentFromData({
                                  ...createOffersRecordData(
                                    createdTime: getCurrentTimestamp,
                                    textOffer:
                                        _model.predlozhenieTextController.text,
                                    priceOffer: int.tryParse(
                                        _model.summOfferTextController.text),
                                    userOffer: currentUserReference,
                                    tehnikaName: _model.selectedTehnik,
                                    aktiv: true,
                                    driverName: '${valueOrDefault<String>(
                                      _model.driver?.displayName,
                                      '00',
                                    )} ${valueOrDefault<String>(
                                      _model.driver?.lastName,
                                      '00',
                                    )}',
                                    nameCompany: _model.company?.companyName,
                                    tehnikaRef: _model.selectedTehnikRef,
                                    driverRef: _model.driver?.reference,
                                    gosNomer: _model.selectedTehnikGosNomer,
                                    chatRef: _model.chatOfer?.reference,
                                  ),
                                  ...mapToFirestore(
                                    {
                                      'dop_ref': _model.dopDocs,
                                    },
                                  ),
                                }, offersRecordReference);
                                _shouldSetState = true;
                                await TelegramNotificationCall.call(
                                  text: 'Новый отклик на заказ. ',
                                );

                                Navigator.pop(context);

                                context.goNamed(
                                  OrdersWebIWidget.routeName,
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              } else {
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title:
                                          Text('Ошибка создания предложения!'),
                                      content: Text(() {
                                        if (_model.predlozhenieTextController
                                                    .text ==
                                                null ||
                                            _model.predlozhenieTextController
                                                    .text ==
                                                '') {
                                          return 'Заполните поле описание для вашего отклика ';
                                        } else if (_model.driverDisplayName ==
                                                null ||
                                            _model.driverDisplayName == '') {
                                          return 'Выберите водителя для заказа!';
                                        } else {
                                          return 'Выберите технику для заказа!';
                                        }
                                      }()),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Понял'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                if (_shouldSetState) safeSetState(() {});
                                return;
                              }

                              if (_shouldSetState) safeSetState(() {});
                            },
                            text: 'Откликнуться',
                            icon: Icon(
                              Icons.flag_sharp,
                              size: 15.0,
                            ),
                            options: FFButtonOptions(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              height: 50.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).primary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Roboto',
                                    color: Colors.white,
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
