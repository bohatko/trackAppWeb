import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/list_empty_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'add_new_order_model.dart';
export 'add_new_order_model.dart';

class AddNewOrderWidget extends StatefulWidget {
  const AddNewOrderWidget({super.key});

  static String routeName = 'Add_new_order';
  static String routePath = 'addNewOrder';

  @override
  State<AddNewOrderWidget> createState() => _AddNewOrderWidgetState();
}

class _AddNewOrderWidgetState extends State<AddNewOrderWidget> {
  late AddNewOrderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? currentUserLocationValue;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddNewOrderModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.alltehnik = await querySpravochnikTekhnikaRecordOnce(
        queryBuilder: (spravochnikTekhnikaRecord) =>
            spravochnikTekhnikaRecord.where(
          'is_show',
          isEqualTo: true,
        ),
      );

      safeSetState(() {});
    });

    _model.discriptionOrderTextController ??= TextEditingController();
    _model.discriptionOrderFocusNode ??= FocusNode();

    _model.smenaTextController ??= TextEditingController();
    _model.smenaFocusNode ??= FocusNode();

    _model.phoneNumberTextController ??= TextEditingController();
    _model.phoneNumberFocusNode ??= FocusNode();

    _model.switchValue = false;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.smenaTextController?.text = '1';
        }));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: !isWeb
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
                title: Text(
                  'Новый заказ',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 2.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 500.0,
            ),
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 30.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Text(
                                  'Выберите категорию техники',
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
                                  0.0, 0.0, 0.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.typeTechnikValueController ??=
                                              FormFieldController<String>(null),
                                      options: functions.getUnikumClass(_model
                                          .alltehnik
                                          ?.map((e) => valueOrDefault<String>(
                                                e.classTehnik,
                                                'NA',
                                              ))
                                          .toList()
                                          ?.toList())!,
                                      onChanged: (val) => safeSetState(
                                          () => _model.typeTechnikValue = val),
                                      height: 50.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: 'Выберите категорию техники',
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      borderWidth: 2.0,
                                      borderRadius: 8.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 4.0, 16.0, 4.0),
                                      hidesUnderline: true,
                                      isOverButton: false,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title:
                                                  Text('Полезная информация!'),
                                              content: Text(
                                                  'Будьте внимательны при выборе техники! На заказ приедет именно то, что Вы укаказали!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Понятно!'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Icon(
                                        Icons.quiz,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Text(
                                  'Выберите технику',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            if (_model.typeTechnikValue != null &&
                                _model.typeTechnikValue != '')
                              Container(
                                width: double.infinity,
                                height: 150.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child: Builder(
                                    builder: (context) {
                                      final alltehnika = _model.alltehnik
                                              ?.where((e) =>
                                                  (e.isShow == true) &&
                                                  (e.classTehnik ==
                                                      _model.typeTechnikValue))
                                              .toList()
                                              ?.toList() ??
                                          [];
                                      if (alltehnika.isEmpty) {
                                        return Container(
                                          height: 100.0,
                                          child: ListEmptyWidget(),
                                        );
                                      }

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: alltehnika.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(width: 12.0),
                                        itemBuilder:
                                            (context, alltehnikaIndex) {
                                          final alltehnikaItem =
                                              alltehnika[alltehnikaIndex];
                                          return InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              _model.selectedTehnikRate =
                                                  alltehnikaItem.rate;
                                              _model.selectedTehnikIndex =
                                                  alltehnikaIndex;
                                              _model.selectedTehnikName =
                                                  alltehnikaItem.typeTehnik;
                                              safeSetState(() {});
                                            },
                                            child: Container(
                                              width: 150.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: _model
                                                              .selectedTehnikIndex ==
                                                          alltehnikaIndex
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .primary
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.network(
                                                        alltehnikaItem
                                                            .mainImage,
                                                        width: 300.0,
                                                        height: 80.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Text(
                                                      alltehnikaItem.typeTehnik,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: _model
                                                                        .selectedTehnikIndex ==
                                                                    alltehnikaIndex
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                    Text(
                                                      'от ${alltehnikaItem.rate.toString()} руб/час',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            color: _model
                                                                        .selectedTehnikIndex ==
                                                                    alltehnikaIndex
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            fontSize: 12.0,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Text(
                                  'Опишите Ваш заказ подробнее',
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
                                  0.0, 0.0, 0.0, 12.0),
                              child: TextFormField(
                                controller:
                                    _model.discriptionOrderTextController,
                                focusNode: _model.discriptionOrderFocusNode,
                                autofocus: false,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                obscureText: false,
                                decoration: InputDecoration(
                                  isDense: false,
                                  labelStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'Описание заказа',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                      ),
                                  errorStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        letterSpacing: 0.0,
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  contentPadding: EdgeInsets.all(12.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      letterSpacing: 0.0,
                                    ),
                                maxLines: null,
                                minLines: 5,
                                maxLength: 200,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                validator: _model
                                    .discriptionOrderTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 8.0, 0.0, 12.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 4.0, 0.0),
                                        child: Text(
                                          'Дата начала\nработ ',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Roboto',
                                                fontSize: 14.0,
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 35.0,
                                      child: VerticalDivider(
                                        thickness: 1.0,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          4.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          final _datePickedDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: getCurrentTimestamp,
                                            firstDate: (getCurrentTimestamp ??
                                                DateTime(1900)),
                                            lastDate: DateTime(2050),
                                            builder: (context, child) {
                                              return wrapInMaterialDatePickerTheme(
                                                context,
                                                child!,
                                                headerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                headerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                headerTextStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 32.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                pickerBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                pickerForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                selectedDateTimeBackgroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                selectedDateTimeForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .info,
                                                actionButtonForegroundColor:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                iconSize: 24.0,
                                              );
                                            },
                                          );

                                          TimeOfDay? _datePickedTime;
                                          if (_datePickedDate != null) {
                                            _datePickedTime =
                                                await showTimePicker(
                                              context: context,
                                              initialTime:
                                                  TimeOfDay.fromDateTime(
                                                      getCurrentTimestamp),
                                              builder: (context, child) {
                                                return wrapInMaterialTimePickerTheme(
                                                  context,
                                                  child!,
                                                  headerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  headerForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  headerTextStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLarge
                                                          .override(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontSize: 32.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                  pickerBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  pickerForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  selectedDateTimeBackgroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  selectedDateTimeForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .info,
                                                  actionButtonForegroundColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primaryText,
                                                  iconSize: 24.0,
                                                );
                                              },
                                            );
                                          }

                                          if (_datePickedDate != null &&
                                              _datePickedTime != null) {
                                            safeSetState(() {
                                              _model.datePicked = DateTime(
                                                _datePickedDate.year,
                                                _datePickedDate.month,
                                                _datePickedDate.day,
                                                _datePickedTime!.hour,
                                                _datePickedTime.minute,
                                              );
                                            });
                                          } else if (_model.datePicked !=
                                              null) {
                                            safeSetState(() {
                                              _model.datePicked =
                                                  getCurrentTimestamp;
                                            });
                                          }
                                        },
                                        child: Container(
                                          height: 36.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            border: Border.all(
                                              color: _model.datePicked == null
                                                  ? Color(0xFFFA8B91)
                                                  : FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 0.0, 4.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      dateTimeFormat(
                                                        "dd MMMM yyyy",
                                                        _model.datePicked,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                      'Дата',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30.0,
                                                child: VerticalDivider(
                                                  thickness: 1.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 8.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      '${valueOrDefault<String>(
                                                        dateTimeFormat(
                                                          "Hm",
                                                          _model.datePicked,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        ),
                                                        'Время',
                                                      )}',
                                                      'Время',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return AlertDialog(
                                                title: Text(
                                                    'Полезная информация!'),
                                                content: Text(
                                                    'Минимальное количество часов аренды : 4 часа ( 1 рабочая смена )'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Понятно!'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Icon(
                                          Icons.quiz,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 8.0),
                                child: Text(
                                  'Выберите количество смен и часов',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.sizeOf(context).width * 1.0,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 40.0,
                                    decoration: BoxDecoration(),
                                    child: Container(
                                      width: 80.0,
                                      child: TextFormField(
                                        controller: _model.smenaTextController,
                                        focusNode: _model.smenaFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.smenaTextController',
                                          Duration(milliseconds: 100),
                                          () => safeSetState(() {}),
                                        ),
                                        textCapitalization:
                                            TextCapitalization.none,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 18.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: '1',
                                          hintStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelMedium
                                                  .override(
                                                    fontFamily: 'Roboto',
                                                    fontSize: 16.0,
                                                    letterSpacing: 0.0,
                                                  ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          contentPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 12.0, 20.0, 12.0),
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                            ),
                                        minLines: 1,
                                        maxLength: 3,
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        buildCounter: (context,
                                                {required currentLength,
                                                required isFocused,
                                                maxLength}) =>
                                            null,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .smenaTextControllerValidator
                                            .asValidator(context),
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[0-9]'))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Text(
                                        'смен(а)',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40.0,
                                    child: VerticalDivider(
                                      thickness: 1.0,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Text(
                                        'по',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 20.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  FlutterFlowDropDown<String>(
                                    controller: _model.hoursValueController ??=
                                        FormFieldController<String>(
                                      _model.hoursValue ??= '4 часа',
                                    ),
                                    options: [
                                      '4 часа',
                                      '8 часов',
                                      '10 часов',
                                      '12 часов'
                                    ],
                                    onChanged: (val) => safeSetState(
                                        () => _model.hoursValue = val),
                                    width: 116.0,
                                    height: 40.0,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          letterSpacing: 0.0,
                                        ),
                                    icon: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      size: 24.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    borderWidth: 2.0,
                                    borderRadius: 8.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 4.0, 12.0, 4.0),
                                    hidesUnderline: true,
                                    isOverButton: false,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 12.0, 0.0, 8.0),
                                child: Text(
                                  'Выберите место проведения работ',
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
                                  0.0, 0.0, 0.0, 12.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                constraints: BoxConstraints(
                                  minHeight: 40.0,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    width: 2.0,
                                  ),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      currentUserLocationValue =
                                          await getCurrentUserLocation(
                                              defaultLocation:
                                                  LatLng(0.0, 0.0));

                                      context.pushNamed(
                                        AddLocationWidget.routeName,
                                        queryParameters: {
                                          'myLocation': serializeParam(
                                            currentUserLocationValue != null
                                                ? currentUserLocationValue
                                                : FFAppState().driverGeoStart,
                                            ParamType.LatLng,
                                          ),
                                        }.withoutNulls,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.rightToLeft,
                                          ),
                                        },
                                      );
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flexible(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12.0, 4.0, 12.0, 4.0),
                                            child: Text(
                                              FFAppState().pickedDataaddress !=
                                                          null &&
                                                      FFAppState()
                                                              .pickedDataaddress !=
                                                          ''
                                                  ? FFAppState()
                                                      .pickedDataaddress
                                                  : 'Выберите местоположение',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.location_on,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 12.0, 0.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    child: TextFormField(
                                      controller:
                                          _model.phoneNumberTextController,
                                      focusNode: _model.phoneNumberFocusNode,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.phoneNumberTextController',
                                        Duration(milliseconds: 100),
                                        () => safeSetState(() {}),
                                      ),
                                      textCapitalization:
                                          TextCapitalization.words,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText:
                                            'Номер телефона контактного лица',
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              letterSpacing: 0.0,
                                            ),
                                        hintText: '+7980000000',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              letterSpacing: 0.0,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        filled: true,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                20.0, 8.0, 0.0, 8.0),
                                        suffixIcon: _model
                                                .phoneNumberTextController!
                                                .text
                                                .isNotEmpty
                                            ? InkWell(
                                                onTap: () async {
                                                  _model
                                                      .phoneNumberTextController
                                                      ?.clear();
                                                  safeSetState(() {});
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  color: Color(0xFF757575),
                                                  size: 22.0,
                                                ),
                                              )
                                            : null,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                          ),
                                      maxLength: 22,
                                      maxLengthEnforcement:
                                          MaxLengthEnforcement.enforced,
                                      buildCounter: (context,
                                              {required currentLength,
                                              required isFocused,
                                              maxLength}) =>
                                          null,
                                      keyboardType: TextInputType.number,
                                      validator: _model
                                          .phoneNumberTextControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [_model.phoneNumberMask],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title:
                                                  Text('Полезная информация!'),
                                              content: Text(
                                                  'Номер телефона на объекте, нужен для связи с ответственным лицом!'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Понятно!'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Icon(
                                        Icons.quiz,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 8.0),
                                        child: Theme(
                                          data: ThemeData(
                                            checkboxTheme: CheckboxThemeData(
                                              visualDensity:
                                                  VisualDensity.standard,
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize.padded,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                              ),
                                            ),
                                            unselectedWidgetColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                          ),
                                          child: Checkbox(
                                            value: _model.needDocValue ??= true,
                                            onChanged: (newValue) async {
                                              safeSetState(() => _model
                                                  .needDocValue = newValue!);
                                            },
                                            side: BorderSide(
                                              width: 2,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                            ),
                                            activeColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            checkColor:
                                                FlutterFlowTheme.of(context)
                                                    .info,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Нужны закрывающие документы',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Roboto',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 0.0, 0.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return AlertDialog(
                                              title:
                                                  Text('Полезная информация!'),
                                              content: Text(
                                                  'Для работы с НДС, документы: Эсм-2. эсм-7'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Понятно!'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Icon(
                                        Icons.quiz,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Switch.adaptive(
                                    value: _model.switchValue!,
                                    onChanged: (newValue) async {
                                      safeSetState(
                                          () => _model.switchValue = newValue!);
                                    },
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8.0, 0.0, 0.0, 0.0),
                                    child: Text(
                                      'Нужно дополнительное оборудование',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (_model.switchValue == true)
                              Container(
                                width: double.infinity,
                                height: 170.0,
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 12.0),
                                  child:
                                      StreamBuilder<List<SpravochnikDopRecord>>(
                                    stream: querySpravochnikDopRecord(
                                      queryBuilder: (spravochnikDopRecord) =>
                                          spravochnikDopRecord
                                              .where(
                                                'is_show',
                                                isEqualTo: true,
                                              )
                                              .orderBy('sort_by'),
                                    ),
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
                                      List<SpravochnikDopRecord>
                                          listViewSpravochnikDopRecordList =
                                          snapshot.data!;
                                      if (listViewSpravochnikDopRecordList
                                          .isEmpty) {
                                        return Container(
                                          height: 100.0,
                                          child: ListEmptyWidget(),
                                        );
                                      }

                                      return ListView.separated(
                                        padding: EdgeInsets.zero,
                                        primary: false,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            listViewSpravochnikDopRecordList
                                                .length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(width: 12.0),
                                        itemBuilder: (context, listViewIndex) {
                                          final listViewSpravochnikDopRecord =
                                              listViewSpravochnikDopRecordList[
                                                  listViewIndex];
                                          return Container(
                                            width: 150.0,
                                            height: 150.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lineColor,
                                              ),
                                            ),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  0.0, -1.0),
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          listViewSpravochnikDopRecord
                                                              .image,
                                                          width: 100.0,
                                                          height: 80.0,
                                                          fit: BoxFit.contain,
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
                                                          listViewSpravochnikDopRecord
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
                                                      Text(
                                                        'от ${listViewSpravochnikDopRecord.rate.toString()} руб/час',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize:
                                                                      12.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 4.0)),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Theme(
                                                      data: ThemeData(
                                                        checkboxTheme:
                                                            CheckboxThemeData(
                                                          visualDensity:
                                                              VisualDensity
                                                                  .compact,
                                                          materialTapTargetSize:
                                                              MaterialTapTargetSize
                                                                  .shrinkWrap,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                        ),
                                                        unselectedWidgetColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                      ),
                                                      child: Checkbox(
                                                        value: _model
                                                                .checkboxValueMap[
                                                            listViewSpravochnikDopRecord] ??= false,
                                                        onChanged:
                                                            (newValue) async {
                                                          safeSetState(() =>
                                                              _model.checkboxValueMap[
                                                                      listViewSpravochnikDopRecord] =
                                                                  newValue!);
                                                          if (newValue!) {
                                                            FFAppState()
                                                                .addToSelectedDop(
                                                                    SelectedDopStruct(
                                                              dopName:
                                                                  listViewSpravochnikDopRecord
                                                                      .name,
                                                              rate:
                                                                  listViewSpravochnikDopRecord
                                                                      .rate,
                                                            ));
                                                            FFAppState()
                                                                .update(() {});
                                                            _model.addToSelectedDopRate(
                                                                listViewSpravochnikDopRecord
                                                                    .rate);
                                                            _model.addToSelectedDopName(
                                                                listViewSpravochnikDopRecord
                                                                    .name);
                                                            safeSetState(() {});
                                                          } else {
                                                            FFAppState()
                                                                .removeFromSelectedDop(
                                                                    SelectedDopStruct(
                                                              rate:
                                                                  listViewSpravochnikDopRecord
                                                                      .rate,
                                                              dopName:
                                                                  listViewSpravochnikDopRecord
                                                                      .name,
                                                            ));
                                                            FFAppState()
                                                                .update(() {});
                                                            _model.removeFromSelectedDopRate(
                                                                listViewSpravochnikDopRecord
                                                                    .rate);
                                                            _model.removeFromSelectedDopName(
                                                                listViewSpravochnikDopRecord
                                                                    .name);
                                                            safeSetState(() {});
                                                          }
                                                        },
                                                        side: BorderSide(
                                                          width: 2,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                        ),
                                                        activeColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        checkColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .info,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                ),
                              ),
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 4.0),
                                child: Text(
                                  'Тариф',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Text(
                                '${_model.selectedTehnikRate.toString()} руб/час с НДС',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Roboto',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 4.0),
                                child: Text(
                                  'Срок аренды часов',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 4.0),
                                child: Text(
                                  '${valueOrDefault<String>(
                                    _model.smenaTextController.text,
                                    '1',
                                  )} смен(а) / ${_model.hoursValue}',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 16.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                            if (_model.switchValue == true)
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 4.0, 0.0, 4.0),
                                  child: Text(
                                    'Доп. оборудование',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            if (_model.switchValue == true)
                              Align(
                                alignment: AlignmentDirectional(-1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 4.0),
                                  child: Text(
                                    ((List<int>? var1, int var2) {
                                      return var2 *
                                          (var1 != null
                                              ? var1.fold<int>(
                                                  0,
                                                  (sum, current) =>
                                                      sum + current)
                                              : 0);
                                    }(_model.selectedDopRate.toList(), () {
                                      if (_model.hoursValue == '4 часа') {
                                        return 4;
                                      } else if (_model.hoursValue ==
                                          '8 часов') {
                                        return 8;
                                      } else if (_model.hoursValue ==
                                          '10 часов') {
                                        return 10;
                                      } else {
                                        return 12;
                                      }
                                    }()))
                                        .toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                              ),
                            Align(
                              alignment: AlignmentDirectional(-1.0, 0.0),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 4.0),
                                child: Text(
                                  'Итого: ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Text(
                                    valueOrDefault<String>(
                                      ((int var1, int var2, int var3,
                                                  List<int> var4) {
                                        return var1 * var2 * var3 +
                                            (var2 *
                                                (var4 != null
                                                    ? var4.fold<int>(
                                                        0,
                                                        (sum, current) =>
                                                            sum + current)
                                                    : 0));
                                      }(_model.selectedTehnikRate, () {
                                        if (_model.hoursValue == '4 часа') {
                                          return 4;
                                        } else if (_model.hoursValue ==
                                            '8 часов') {
                                          return 8;
                                        } else if (_model.hoursValue ==
                                            '10 часов') {
                                          return 10;
                                        } else {
                                          return 12;
                                        }
                                      }(),
                                              valueOrDefault<int>(
                                                int.tryParse(_model
                                                    .smenaTextController.text),
                                                1,
                                              ),
                                              _model.selectedDopRate.toList()))
                                          .toString(),
                                      '0',
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 20.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      4.0, 0.0, 0.0, 0.0),
                                  child: Icon(
                                    Icons.currency_ruble_outlined,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    size: 22.0,
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 1.0,
                              color: FlutterFlowTheme.of(context).primary,
                            ),
                            Opacity(
                              opacity: (_model.datePicked != null) &&
                                      (_model.phoneNumberTextController.text !=
                                              null &&
                                          _model.phoneNumberTextController
                                                  .text !=
                                              '') &&
                                      (FFAppState().pickedDataaddress != null &&
                                          FFAppState().pickedDataaddress != '')
                                  ? 1.0
                                  : 0.5,
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 0.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    if ((_model.datePicked != null) &&
                                        (_model.phoneNumberTextController
                                                    .text !=
                                                null &&
                                            _model.phoneNumberTextController
                                                    .text !=
                                                '') &&
                                        (FFAppState().pickedDataaddress !=
                                                null &&
                                            FFAppState().pickedDataaddress !=
                                                '') &&
                                        (_model.discriptionOrderTextController
                                                    .text !=
                                                null &&
                                            _model.discriptionOrderTextController
                                                    .text !=
                                                '') &&
                                        (_model.typeTechnikValue != null &&
                                            _model.typeTechnikValue != '') &&
                                        (_model.smenaTextController.text !=
                                                null &&
                                            _model.smenaTextController.text !=
                                                '') &&
                                        (_model.hoursValue != null &&
                                            _model.hoursValue != '')) {
                                      _model.q1 =
                                          await queryOrdersRecordCount();
                                      _shouldSetState = true;
                                      // запрашиваем админа
                                      _model.manager =
                                          await queryUsersRecordOnce(
                                        queryBuilder: (usersRecord) =>
                                            usersRecord.where(
                                          'category',
                                          isEqualTo: 'Администратор',
                                        ),
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _shouldSetState = true;

                                      var ordersRecordReference =
                                          OrdersRecord.collection.doc();
                                      await ordersRecordReference.set({
                                        ...createOrdersRecordData(
                                          owner: currentUserReference,
                                          description: _model
                                              .discriptionOrderTextController
                                              .text,
                                          timeCreated: getCurrentTimestamp,
                                          orderNumber: (_model.q1!) + 1,
                                          orderStatus: 'Новый',
                                          startTime: _model.datePicked,
                                          numberOtvets: _model
                                              .phoneNumberTextController.text,
                                          needDoc: _model.needDocValue,
                                          typeTehnik: valueOrDefault<String>(
                                            _model.selectedTehnikName,
                                            'Не указана',
                                          ),
                                          workFlow: -1,
                                          location:
                                              FFAppState().pickedDataaddress,
                                          duractionTime: () {
                                            if (_model.hoursValue == '4 часа') {
                                              return 4;
                                            } else if (_model.hoursValue ==
                                                '8 часов') {
                                              return 8;
                                            } else if (_model.hoursValue ==
                                                '10 часов') {
                                              return 10;
                                            } else {
                                              return 12;
                                            }
                                          }()
                                              .toString(),
                                          durationSmen: int.tryParse(
                                              _model.smenaTextController.text),
                                          manager: _model.manager?.reference,
                                          orderPrice: valueOrDefault<int>(
                                            _model.selectedTehnikRate *
                                                () {
                                                  if (_model.hoursValue ==
                                                      '4 часа') {
                                                    return 4;
                                                  } else if (_model
                                                          .hoursValue ==
                                                      '8 часов') {
                                                    return 8;
                                                  } else if (_model
                                                          .hoursValue ==
                                                      '10 часов') {
                                                    return 10;
                                                  } else {
                                                    return 12;
                                                  }
                                                }() *
                                                int.parse(_model
                                                    .smenaTextController.text),
                                            0,
                                          ),
                                          nacenka: 0.9,
                                          orderPriceMinusNacenka:
                                              valueOrDefault<int>(
                                            ((_model.selectedTehnikRate *
                                                        () {
                                                          if (_model
                                                                  .hoursValue ==
                                                              '4 часа') {
                                                            return 4;
                                                          } else if (_model
                                                                  .hoursValue ==
                                                              '8 часов') {
                                                            return 8;
                                                          } else if (_model
                                                                  .hoursValue ==
                                                              '10 часов') {
                                                            return 10;
                                                          } else {
                                                            return 12;
                                                          }
                                                        }() *
                                                        int.parse(_model
                                                            .smenaTextController
                                                            .text)) *
                                                    0.9)
                                                .toInt(),
                                            0,
                                          ),
                                          tehnikaNaZakaz: 'Не назначена',
                                          draverGeo:
                                              FFAppState().driverGeoStart,
                                          orderGeo: FFAppState()
                                              .pickedDataaddressLatLong,
                                          orderHours: _model.hoursValue,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'dop_oborud':
                                                _model.selectedDopName,
                                            'list_arenda':
                                                getSelectedDopListFirestoreData(
                                              FFAppState().selectedDop,
                                            ),
                                          },
                                        ),
                                      });
                                      _model.createdOrder =
                                          OrdersRecord.getDocumentFromData({
                                        ...createOrdersRecordData(
                                          owner: currentUserReference,
                                          description: _model
                                              .discriptionOrderTextController
                                              .text,
                                          timeCreated: getCurrentTimestamp,
                                          orderNumber: (_model.q1!) + 1,
                                          orderStatus: 'Новый',
                                          startTime: _model.datePicked,
                                          numberOtvets: _model
                                              .phoneNumberTextController.text,
                                          needDoc: _model.needDocValue,
                                          typeTehnik: valueOrDefault<String>(
                                            _model.selectedTehnikName,
                                            'Не указана',
                                          ),
                                          workFlow: -1,
                                          location:
                                              FFAppState().pickedDataaddress,
                                          duractionTime: () {
                                            if (_model.hoursValue == '4 часа') {
                                              return 4;
                                            } else if (_model.hoursValue ==
                                                '8 часов') {
                                              return 8;
                                            } else if (_model.hoursValue ==
                                                '10 часов') {
                                              return 10;
                                            } else {
                                              return 12;
                                            }
                                          }()
                                              .toString(),
                                          durationSmen: int.tryParse(
                                              _model.smenaTextController.text),
                                          manager: _model.manager?.reference,
                                          orderPrice: valueOrDefault<int>(
                                            _model.selectedTehnikRate *
                                                () {
                                                  if (_model.hoursValue ==
                                                      '4 часа') {
                                                    return 4;
                                                  } else if (_model
                                                          .hoursValue ==
                                                      '8 часов') {
                                                    return 8;
                                                  } else if (_model
                                                          .hoursValue ==
                                                      '10 часов') {
                                                    return 10;
                                                  } else {
                                                    return 12;
                                                  }
                                                }() *
                                                int.parse(_model
                                                    .smenaTextController.text),
                                            0,
                                          ),
                                          nacenka: 0.9,
                                          orderPriceMinusNacenka:
                                              valueOrDefault<int>(
                                            ((_model.selectedTehnikRate *
                                                        () {
                                                          if (_model
                                                                  .hoursValue ==
                                                              '4 часа') {
                                                            return 4;
                                                          } else if (_model
                                                                  .hoursValue ==
                                                              '8 часов') {
                                                            return 8;
                                                          } else if (_model
                                                                  .hoursValue ==
                                                              '10 часов') {
                                                            return 10;
                                                          } else {
                                                            return 12;
                                                          }
                                                        }() *
                                                        int.parse(_model
                                                            .smenaTextController
                                                            .text)) *
                                                    0.9)
                                                .toInt(),
                                            0,
                                          ),
                                          tehnikaNaZakaz: 'Не назначена',
                                          draverGeo:
                                              FFAppState().driverGeoStart,
                                          orderGeo: FFAppState()
                                              .pickedDataaddressLatLong,
                                          orderHours: _model.hoursValue,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'dop_oborud':
                                                _model.selectedDopName,
                                            'list_arenda':
                                                getSelectedDopListFirestoreData(
                                              FFAppState().selectedDop,
                                            ),
                                          },
                                        ),
                                      }, ordersRecordReference);
                                      _shouldSetState = true;
                                      _model.companyZ =
                                          await queryCompanyRecordOnce(
                                        parent: _model.createdOrder?.owner,
                                        singleRecord: true,
                                      ).then((s) => s.firstOrNull);
                                      _shouldSetState = true;

                                      var chatsRecordReference =
                                          ChatsRecord.collection.doc();
                                      await chatsRecordReference.set({
                                        ...createChatsRecordData(
                                          active: true,
                                          chatNumber: random_data.randomInteger(
                                              10000, 99999999),
                                          orderRef:
                                              _model.createdOrder?.reference,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'users_ref': [
                                              _model.manager?.reference
                                            ],
                                          },
                                        ),
                                      });
                                      _model.chat =
                                          ChatsRecord.getDocumentFromData({
                                        ...createChatsRecordData(
                                          active: true,
                                          chatNumber: random_data.randomInteger(
                                              10000, 99999999),
                                          orderRef:
                                              _model.createdOrder?.reference,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'users_ref': [
                                              _model.manager?.reference
                                            ],
                                          },
                                        ),
                                      }, chatsRecordReference);
                                      _shouldSetState = true;
                                      unawaited(
                                        () async {
                                          await _model.chat!.reference.update({
                                            ...mapToFirestore(
                                              {
                                                'users_ref':
                                                    FieldValue.arrayUnion(
                                                        [currentUserReference]),
                                              },
                                            ),
                                          });
                                        }(),
                                      );
                                      unawaited(
                                        () async {
                                          await _model.createdOrder!.reference
                                              .update(createOrdersRecordData(
                                            chatWithZak: _model.chat?.reference,
                                          ));
                                        }(),
                                      );
                                      unawaited(
                                        () async {
                                          await TelegramNotificationCall.call(
                                            text:
                                                ' <b>Создан новый заказ с №${_model.createdOrder?.orderNumber?.toString()} </b></tr><b>Описание заказа: </b>${_model.createdOrder?.description}</tr><b>Предложение по цене:  </b>${_model.createdOrder?.orderPrice?.toString()} руб.</tr><b>Нужна техника:  </b>${_model.createdOrder?.typeTehnik}',
                                          );
                                        }(),
                                      );
                                      safeSetState(() {
                                        _model.discriptionOrderTextController
                                            ?.clear();
                                        _model.phoneNumberTextController
                                            ?.clear();
                                        _model.smenaTextController?.clear();
                                      });
                                      FFAppState().selectedDop = [];

                                      context.goNamed(
                                        HomePageWidget.routeName,
                                        extra: <String, dynamic>{
                                          kTransitionInfoKey: TransitionInfo(
                                            hasTransition: true,
                                            transitionType:
                                                PageTransitionType.bottomToTop,
                                          ),
                                        },
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Заполните обязательные поля!',
                                            style: TextStyle(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 4000),
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .error,
                                        ),
                                      );
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: 'Оформить заказ',
                                  options: FFButtonOptions(
                                    width:
                                        MediaQuery.sizeOf(context).width * 1.0,
                                    height: 40.0,
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
