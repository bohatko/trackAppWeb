import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/components/document_componet_widget.dart';
import '/components/header_widget.dart';
import '/components/menu_web_widget.dart';
import '/components/timelaps_widget.dart';
import '/components/timeline2_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web/alert_add_offer/alert_add_offer_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'otklik_orders_i_model.dart';
export 'otklik_orders_i_model.dart';

class OtklikOrdersIWidget extends StatefulWidget {
  const OtklikOrdersIWidget({
    super.key,
    required this.orderRef,
  });

  final DocumentReference? orderRef;

  static String routeName = 'OtklikOrders_I';
  static String routePath = 'otklikOrdersI';

  @override
  State<OtklikOrdersIWidget> createState() => _OtklikOrdersIWidgetState();
}

class _OtklikOrdersIWidgetState extends State<OtklikOrdersIWidget> {
  late OtklikOrdersIModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OtklikOrdersIModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        backgroundColor: Color(0xFFF3F3F3),
        drawer: StreamBuilder<List<ChatsRecord>>(
          stream: queryChatsRecord(
            queryBuilder: (chatsRecord) => chatsRecord
                .where(
                  'order_ref',
                  isEqualTo: widget!.orderRef,
                )
                .where(
                  'users_ref',
                  arrayContains: currentUserReference,
                ),
            singleRecord: true,
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 30.0,
                  height: 30.0,
                  child: SpinKitCircle(
                    color: FlutterFlowTheme.of(context).primary,
                    size: 30.0,
                  ),
                ),
              );
            }
            List<ChatsRecord> drawerChatsRecordList = snapshot.data!;
            // Return an empty Container when the item does not exist.
            if (snapshot.data!.isEmpty) {
              return Container();
            }
            final drawerChatsRecord = drawerChatsRecordList.isNotEmpty
                ? drawerChatsRecordList.first
                : null;

            return Container(
              width: 500.0,
              child: Drawer(
                elevation: 16.0,
                child: Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(12.0, 20.0, 12.0, 24.0),
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 500.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 8.0, 16.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Чат начат!',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            fontFamily: 'Roboto',
                                            fontSize: 14.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Stack(
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 8.0),
                                    child: Text(
                                      'Пожалуйста, относитесь друг к другу с уважением в рамках предстоящего обсуждения, проявляя вежливость, готовность слушать, стремление к конструктивному диалогу. Поддерживайте дружелюбную и позитивную атмосферу.',
                                      textAlign: TextAlign.justify,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                  Stack(
                                    children: [],
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).alternate,
                              ),
                              Flexible(
                                child: Builder(
                                  builder: (context) {
                                    final messages =
                                        drawerChatsRecord?.message?.toList() ??
                                            [];

                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount: messages.length,
                                      itemBuilder: (context, messagesIndex) {
                                        final messagesItem =
                                            messages[messagesIndex];
                                        return Stack(
                                          children: [
                                            if (messagesItem.userRef !=
                                                currentUserReference)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Flexible(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        8.0,
                                                                        8.0,
                                                                        2.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        8.0,
                                                                        12.0,
                                                                        8.0),
                                                                child: Text(
                                                                  messagesItem
                                                                      .text,
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
                                                            ),
                                                          ),
                                                          if (messagesItem
                                                                      .photo !=
                                                                  null &&
                                                              messagesItem
                                                                      .photo !=
                                                                  '')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          4.0,
                                                                          8.0,
                                                                          4.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  await Navigator
                                                                      .push(
                                                                    context,
                                                                    PageTransition(
                                                                      type: PageTransitionType
                                                                          .fade,
                                                                      child:
                                                                          FlutterFlowExpandedImageView(
                                                                        image:
                                                                            OctoImage(
                                                                          placeholderBuilder: (_) =>
                                                                              SizedBox.expand(
                                                                            child:
                                                                                Image(
                                                                              image: BlurHashImage('L6PZfSi_.AyE_3t7t7R**0o#DgR4'),
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          image:
                                                                              NetworkImage(
                                                                            messagesItem.photo,
                                                                          ),
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                        allowRotation:
                                                                            false,
                                                                        tag: messagesItem
                                                                            .photo,
                                                                        useHeroAnimation:
                                                                            true,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Hero(
                                                                  tag: messagesItem
                                                                      .photo,
                                                                  transitionOnUserGestures:
                                                                      true,
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    child:
                                                                        OctoImage(
                                                                      placeholderBuilder:
                                                                          (_) =>
                                                                              SizedBox.expand(
                                                                        child:
                                                                            Image(
                                                                          image:
                                                                              BlurHashImage('L6PZfSi_.AyE_3t7t7R**0o#DgR4'),
                                                                          fit: BoxFit
                                                                              .cover,
                                                                        ),
                                                                      ),
                                                                      image:
                                                                          NetworkImage(
                                                                        messagesItem
                                                                            .photo,
                                                                      ),
                                                                      width:
                                                                          300.0,
                                                                      height:
                                                                          200.0,
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                dateTimeFormat(
                                                                  "relative",
                                                                  messagesItem
                                                                      .time!,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
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
                                            if (messagesItem.userRef ==
                                                currentUserReference)
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        8.0, 0.0, 8.0, 8.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Flexible(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        8.0,
                                                                        8.0,
                                                                        2.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        8.0,
                                                                        12.0,
                                                                        8.0),
                                                                child: Text(
                                                                  messagesItem
                                                                      .text,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          if (messagesItem
                                                                      .photo !=
                                                                  null &&
                                                              messagesItem
                                                                      .photo !=
                                                                  '')
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          4.0,
                                                                          8.0,
                                                                          4.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                child:
                                                                    OctoImage(
                                                                  placeholderBuilder:
                                                                      (_) => SizedBox
                                                                          .expand(
                                                                    child:
                                                                        Image(
                                                                      image: BlurHashImage(
                                                                          'L6PZfSi_.AyE_3t7t7R**0o#DgR4'),
                                                                      fit: BoxFit
                                                                          .cover,
                                                                    ),
                                                                  ),
                                                                  image:
                                                                      NetworkImage(
                                                                    messagesItem
                                                                        .photo,
                                                                  ),
                                                                  width: 300.0,
                                                                  height: 200.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                            ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              child: Text(
                                                                dateTimeFormat(
                                                                  "relative",
                                                                  messagesItem
                                                                      .time!,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
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
                                          ],
                                        );
                                      },
                                      controller: _model.listViewController,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 2.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xB3FFFFFF),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16.0, 4.0, 16.0, 4.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Stack(
                                        alignment:
                                            AlignmentDirectional(1.0, 0.0),
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: TextFormField(
                                              controller: _model.textController,
                                              focusNode:
                                                  _model.textFieldFocusNode,
                                              onChanged: (_) =>
                                                  EasyDebounce.debounce(
                                                '_model.textController',
                                                Duration(milliseconds: 100),
                                                () => safeSetState(() {}),
                                              ),
                                              autofocus: false,
                                              textCapitalization:
                                                  TextCapitalization.sentences,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                isDense: true,
                                                hintText: 'Введите сообщение..',
                                                hintStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmall
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                filled: true,
                                                fillColor: Color(0x7FFFFFFF),
                                                contentPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(20.0, 18.0,
                                                            40.0, 18.0),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Roboto',
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        lineHeight: 1.0,
                                                      ),
                                              maxLines: 3,
                                              minLines: 1,
                                              maxLength: 200,
                                              maxLengthEnforcement:
                                                  MaxLengthEnforcement.enforced,
                                              buildCounter: (context,
                                                      {required currentLength,
                                                      required isFocused,
                                                      maxLength}) =>
                                                  null,
                                              cursorColor:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              validator: _model
                                                  .textControllerValidator
                                                  .asValidator(context),
                                            ),
                                          ),
                                          Stack(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            children: [
                                              if (_model.textController.text !=
                                                      null &&
                                                  _model.textController.text !=
                                                      '')
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                8.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await drawerChatsRecord!
                                                            .reference
                                                            .update({
                                                          ...mapToFirestore(
                                                            {
                                                              'message': FieldValue
                                                                  .arrayUnion([
                                                                getMessageFirestoreData(
                                                                  createMessageStruct(
                                                                    time:
                                                                        getCurrentTimestamp,
                                                                    text: _model
                                                                        .textController
                                                                        .text,
                                                                    userRef:
                                                                        currentUserReference,
                                                                    clearUnsetFields:
                                                                        false,
                                                                  ),
                                                                  true,
                                                                )
                                                              ]),
                                                            },
                                                          ),
                                                        });
                                                        unawaited(
                                                          () async {
                                                            await NotificationRecord
                                                                .collection
                                                                .doc()
                                                                .set(
                                                                    createNotificationRecordData(
                                                                  message:
                                                                      ' Проверьте чаты!',
                                                                  time:
                                                                      getCurrentTimestamp,
                                                                  isRead: false,
                                                                  sender:
                                                                      'Системное уведомление!',
                                                                  header:
                                                                      'Новое сообщение в чате!',
                                                                  userRef:
                                                                      currentUserReference,
                                                                  public: false,
                                                                  chatRef:
                                                                      drawerChatsRecord
                                                                          ?.reference,
                                                                ));
                                                          }(),
                                                        );
                                                        await _model
                                                            .listViewController
                                                            ?.animateTo(
                                                          _model
                                                              .listViewController!
                                                              .position
                                                              .maxScrollExtent,
                                                          duration: Duration(
                                                              milliseconds:
                                                                  300),
                                                          curve: Curves.ease,
                                                        );
                                                        safeSetState(() {
                                                          _model.textController
                                                              ?.clear();
                                                        });
                                                      },
                                                      child: Icon(
                                                        Icons.send_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 30.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              if (_model.textController.text ==
                                                      null ||
                                                  _model.textController.text ==
                                                      '')
                                                Opacity(
                                                  opacity: 0.5,
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  8.0,
                                                                  0.0),
                                                      child: Icon(
                                                        Icons.send_rounded,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 30.0,
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
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              wrapWithModel(
                model: _model.menuWebModel,
                updateCallback: () => safeSetState(() {}),
                child: MenuWebWidget(),
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    wrapWithModel(
                      model: _model.headerModel,
                      updateCallback: () => safeSetState(() {}),
                      child: HeaderWidget(),
                    ),
                    Expanded(
                      child: StreamBuilder<OrdersRecord>(
                        stream: OrdersRecord.getDocument(widget!.orderRef!),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 30.0,
                                height: 30.0,
                                child: SpinKitCircle(
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 30.0,
                                ),
                              ),
                            );
                          }

                          final containerOrdersRecord = snapshot.data!;

                          return Container(
                            width: MediaQuery.sizeOf(context).width * 1.0,
                            height: MediaQuery.sizeOf(context).height * 1.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsets.all(32.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          1.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              1.0,
                                      constraints: BoxConstraints(
                                        minWidth: 880.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Container(
                                        constraints: BoxConstraints(
                                          minWidth: 590.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(6.0),
                                          border: Border.all(
                                            color: Color(0xFFEBEAE2),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: SingleChildScrollView(
                                          controller: _model.columnController1,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(16.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Text(
                                                        '#${containerOrdersRecord.orderNumber.toString()}',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 14.0,
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
                                                                  16.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            containerOrdersRecord
                                                                .typeTehnik,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Roboto',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                ),
                                                          ),
                                                          if (containerOrdersRecord
                                                              .listUserZayavki
                                                              .contains(
                                                                  currentUserReference))
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                scaffoldKey
                                                                    .currentState!
                                                                    .openDrawer();
                                                              },
                                                              text:
                                                                  'Чат по заказу',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 150.0,
                                                                height: 35.0,
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          14.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                                elevation: 1.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .transparent,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6.0),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  20.0),
                                                      child: Text(
                                                        containerOrdersRecord
                                                            .description,
                                                        maxLines: 3,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                            ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Container(
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .newBorderColor,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          6.0,
                                                                          10.0,
                                                                          6.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child: Icon(
                                                                      FFIcons
                                                                          .krublesigncircle,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          26.0,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    '${containerOrdersRecord.orderPriceMinusNacenka.toString()} ₽',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          fontSize:
                                                                              16.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          height: 40.0,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .newBorderColor,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        6.0,
                                                                        10.0,
                                                                        6.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Старт: ${dateTimeFormat(
                                                                    "dd MMM yyyy",
                                                                    containerOrdersRecord
                                                                        .startTime,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  )}  ${dateTimeFormat(
                                                                    "Hm",
                                                                    containerOrdersRecord
                                                                        .startTime,
                                                                    locale: FFLocalizations.of(
                                                                            context)
                                                                        .languageCode,
                                                                  )}',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 480.0,
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.0),
                                                      child: Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height: 480.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 1.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height: 480.0,
                                                          child: custom_widgets
                                                              .EmptyMap(
                                                            width: MediaQuery
                                                                        .sizeOf(
                                                                            context)
                                                                    .width *
                                                                1.0,
                                                            height: 480.0,
                                                            zoom: 12.0,
                                                            orderGeo:
                                                                containerOrdersRecord
                                                                    .orderGeo,
                                                            driverGeo:
                                                                containerOrdersRecord
                                                                    .draverGeo,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    20.0),
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          constraints:
                                                              BoxConstraints(
                                                            minHeight: 84.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child: Text(
                                                              containerOrdersRecord
                                                                  .location,
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
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        32.0, 0.0, 0.0, 0.0),
                                    child: Container(
                                      width: 340.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .newBorderColor,
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 52.0,
                                            decoration: BoxDecoration(
                                              color: Color(0xFFF9F9FB),
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      20.0, 0.0, 20.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Ваше предложение',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Roboto',
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: SingleChildScrollView(
                                              controller:
                                                  _model.columnController2,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Divider(
                                                    height: 1.0,
                                                    thickness: 1.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                  Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    children: [
                                                      if ((containerOrdersRecord
                                                                  .orderStatus ==
                                                              'Новый') &&
                                                          !containerOrdersRecord
                                                              .listUserZayavki
                                                              .contains(
                                                                  currentUserReference))
                                                        Builder(
                                                          builder: (context) =>
                                                              Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    16.0),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                var _shouldSetState =
                                                                    false;
                                                                _model.tehnikaColll =
                                                                    await queryTehnikaRecordOnce(
                                                                  parent:
                                                                      currentUserReference,
                                                                  singleRecord:
                                                                      true,
                                                                ).then((s) => s
                                                                        .firstOrNull);
                                                                _shouldSetState =
                                                                    true;
                                                                if (_model
                                                                        .tehnikaColll !=
                                                                    null) {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            FocusScope.of(dialogContext).unfocus();
                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                          },
                                                                          child:
                                                                              AlertAddOfferWidget(
                                                                            orderDoc:
                                                                                containerOrdersRecord,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                } else {
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'Ошибка!'),
                                                                        content:
                                                                            Text('У вас не добавлена техника! Чтобы выполнять заказы -нужно добавить технику в разделе \"Техника и оборудование\"'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext),
                                                                            child:
                                                                                Text('Понятно!'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                  if (_shouldSetState)
                                                                    safeSetState(
                                                                        () {});
                                                                  return;
                                                                }

                                                                if (_shouldSetState)
                                                                  safeSetState(
                                                                      () {});
                                                              },
                                                              text:
                                                                  'Откликнуться',
                                                              icon: Icon(
                                                                Icons
                                                                    .add_circle_outline_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 22.0,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 44.0,
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                                iconPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                color: Color(
                                                                    0x10EC9832),
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          'Roboto',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      fontSize:
                                                                          18.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                elevation: 0.0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6.0),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      if ((containerOrdersRecord
                                                                  .orderStatus ==
                                                              'Новый') &&
                                                          containerOrdersRecord
                                                              .listUserZayavki
                                                              .contains(
                                                                  currentUserReference))
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  12.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                constraints:
                                                                    BoxConstraints(
                                                                  minHeight:
                                                                      52.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .newBorderColor,
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              12.0),
                                                                  child: Text(
                                                                    'Мы сообщили заказчику, что вы готовы выполнить заказ. Ждём ответ от заказчика!  Это может занять какое то время..',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                height: 52.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFEBEAE2),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              6.0),
                                                                  border: Border
                                                                      .all(
                                                                    color: Color(
                                                                        0xFFEBEAE2),
                                                                  ),
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .flare_rounded,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'Ждём ответ...',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Roboto',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 16.0)),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                  if (containerOrdersRecord
                                                          .orderStatus !=
                                                      'Новый')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  12.0,
                                                                  16.0,
                                                                  30.0),
                                                      child:
                                                          SingleChildScrollView(
                                                        controller: _model
                                                            .columnController3,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            wrapWithModel(
                                                              model: _model
                                                                  .timeline2Model1,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  Timeline2Widget(
                                                                date: containerOrdersRecord
                                                                    .timeCreated!,
                                                                header:
                                                                    'Заказ создан!',
                                                                message:
                                                                    'Выбираем исполнителя',
                                                                icon: Icon(
                                                                  Icons
                                                                      .not_started_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 24.0,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                            if (containerOrdersRecord
                                                                    .orderStatus !=
                                                                'Новый')
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .timelapsModel1,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        TimelapsWidget(
                                                                      timeCreated:
                                                                          containerOrdersRecord
                                                                              .lastEdited!,
                                                                      mess:
                                                                          'Вас выбрали исполнителем заказа. Скачайте ЭСМ-2. Дайте водителю распоряжение на выполнение работ!',
                                                                      text1:
                                                                          'Заказ в работе!',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            if (containerOrdersRecord
                                                                    .orderStatus !=
                                                                'Новый')
                                                              wrapWithModel(
                                                                model: _model
                                                                    .documentComponetModel1,
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    DocumentComponetWidget(
                                                                  name: 'ЭСМ-2',
                                                                  action:
                                                                      () async {
                                                                    _model.docss44 =
                                                                        await queryDocsRecordOnce(
                                                                      parent: widget!
                                                                          .orderRef,
                                                                      singleRecord:
                                                                          true,
                                                                    ).then((s) =>
                                                                            s.firstOrNull);
                                                                    await actions
                                                                        .downloadFile(
                                                                      _model
                                                                          .docss44!
                                                                          .docEsm2,
                                                                    );

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                ),
                                                              ),
                                                            if ((containerOrdersRecord
                                                                        .orderStatus !=
                                                                    'Новый') &&
                                                                (containerOrdersRecord
                                                                        .workFlow >=
                                                                    0))
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .timelapsModel2,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        TimelapsWidget(
                                                                      timeCreated:
                                                                          containerOrdersRecord
                                                                              .lastEdited!,
                                                                      mess:
                                                                          'Отслеживайте местоположение водителя на карте! Как только он закончит работу - вы сможете подтвердить выполнение заказа!',
                                                                      text1:
                                                                          'Водитель начал работу!',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            if ((containerOrdersRecord
                                                                        .orderStatus !=
                                                                    'Новый') &&
                                                                (containerOrdersRecord
                                                                        .workFlow >
                                                                    1))
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        -1.0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      wrapWithModel(
                                                                    model: _model
                                                                        .timelapsModel3,
                                                                    updateCallback: () =>
                                                                        safeSetState(
                                                                            () {}),
                                                                    child:
                                                                        TimelapsWidget(
                                                                      timeCreated:
                                                                          containerOrdersRecord
                                                                              .lastEdited!,
                                                                      mess:
                                                                          'Водитель завершил заказ! Проверте корректность работы и если нет претензий  - нажмите: \"Принять работу\"',
                                                                      text1:
                                                                          'Водитель закончил работу!',
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            if ((containerOrdersRecord
                                                                        .orderStatus !=
                                                                    'Новый') &&
                                                                (containerOrdersRecord
                                                                        .workFlow >
                                                                    1) &&
                                                                (containerOrdersRecord
                                                                        .orderStatus !=
                                                                    'В работе'))
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    wrapWithModel(
                                                                  model: _model
                                                                      .documentComponetModel2,
                                                                  updateCallback: () =>
                                                                      safeSetState(
                                                                          () {}),
                                                                  child:
                                                                      DocumentComponetWidget(
                                                                    name:
                                                                        'ЭСМ-7',
                                                                    action:
                                                                        () async {
                                                                      _model.docss =
                                                                          await queryDocsRecordOnce(
                                                                        parent:
                                                                            widget!.orderRef,
                                                                        singleRecord:
                                                                            true,
                                                                      ).then((s) =>
                                                                              s.firstOrNull);
                                                                      await actions
                                                                          .downloadFile(
                                                                        _model
                                                                            .docss!
                                                                            .docEsm7Isp,
                                                                      );

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                  ),
                                                                ),
                                                              ),
                                                            if ((containerOrdersRecord
                                                                        .orderStatus ==
                                                                    'В работе') &&
                                                                (containerOrdersRecord
                                                                        .workFlow >=
                                                                    0))
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            12.0,
                                                                            0.0,
                                                                            0.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    var confirmDialogResponse =
                                                                        await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Вы уверены?'),
                                                                                  content: Text('Действие необратимо! Заказ будет возвращен водителю на доработку!'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Отмена'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Подтверждаю!'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                    if (confirmDialogResponse) {
                                                                      unawaited(
                                                                        () async {
                                                                          await containerOrdersRecord
                                                                              .reference
                                                                              .update(createOrdersRecordData(
                                                                            lastEdited:
                                                                                getCurrentTimestamp,
                                                                            workFlow:
                                                                                0,
                                                                          ));
                                                                        }(),
                                                                      );
                                                                    }
                                                                  },
                                                                  text:
                                                                      'Вернуть на доработку',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        42.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            6.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            if ((containerOrdersRecord
                                                                        .orderStatus ==
                                                                    'В работе') &&
                                                                (containerOrdersRecord
                                                                        .workFlow >
                                                                    1))
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        12.0,
                                                                        0.0,
                                                                        12.0),
                                                                child:
                                                                    FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    var confirmDialogResponse =
                                                                        await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('Вы уверены?'),
                                                                                  content: Text('Действие необратимо! Заказ будет окончательно закрыт!'),
                                                                                  actions: [
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                      child: Text('Отмена'),
                                                                                    ),
                                                                                    TextButton(
                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                      child: Text('Подтверждаю!'),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            ) ??
                                                                            false;
                                                                    if (confirmDialogResponse) {
                                                                      unawaited(
                                                                        () async {
                                                                          await containerOrdersRecord
                                                                              .reference
                                                                              .update(createOrdersRecordData(
                                                                            lastEdited:
                                                                                getCurrentTimestamp,
                                                                            orderStatus:
                                                                                'На проверке',
                                                                            draverGeo:
                                                                                FFAppState().driverGeoStart,
                                                                          ));
                                                                        }(),
                                                                      );
                                                                      _model.offer =
                                                                          await queryOffersRecordOnce(
                                                                        parent:
                                                                            containerOrdersRecord.reference,
                                                                        queryBuilder:
                                                                            (offersRecord) =>
                                                                                offersRecord.where(
                                                                          'is_win',
                                                                          isEqualTo:
                                                                              true,
                                                                        ),
                                                                        singleRecord:
                                                                            true,
                                                                      ).then((s) =>
                                                                              s.firstOrNull);
                                                                      _model.collDoxs =
                                                                          await queryDocsRecordOnce(
                                                                        parent:
                                                                            containerOrdersRecord.reference,
                                                                        singleRecord:
                                                                            true,
                                                                      ).then((s) =>
                                                                              s.firstOrNull);
                                                                      _model.esmIsp =
                                                                          await queryDocumentsRecordOnce(
                                                                        queryBuilder:
                                                                            (documentsRecord) =>
                                                                                documentsRecord.where(
                                                                          'name',
                                                                          isEqualTo:
                                                                              'ЭСМ-7 (исполнитель)',
                                                                        ),
                                                                        singleRecord:
                                                                            true,
                                                                      ).then((s) =>
                                                                              s.firstOrNull);
                                                                      _model.esm7Zak =
                                                                          await queryDocumentsRecordOnce(
                                                                        queryBuilder:
                                                                            (documentsRecord) =>
                                                                                documentsRecord.where(
                                                                          'name',
                                                                          isEqualTo:
                                                                              'ЭСМ-7 (заказчик)',
                                                                        ),
                                                                        singleRecord:
                                                                            true,
                                                                      ).then((s) =>
                                                                              s.firstOrNull);
                                                                      _model.compIsp =
                                                                          await queryCompanyRecordOnce(
                                                                        parent:
                                                                            currentUserReference,
                                                                        singleRecord:
                                                                            true,
                                                                      ).then((s) =>
                                                                              s.firstOrNull);
                                                                      _model.comZak =
                                                                          await queryCompanyRecordOnce(
                                                                        parent:
                                                                            containerOrdersRecord.owner,
                                                                        singleRecord:
                                                                            true,
                                                                      ).then((s) =>
                                                                              s.firstOrNull);
                                                                      await Future
                                                                          .wait([
                                                                        Future(
                                                                            () async {
                                                                          try {
                                                                            final result =
                                                                                await FirebaseFunctions.instanceFor(region: 'europe-central2').httpsCallable('simpleReplaceInDocx').call({
                                                                              "orderNumber": containerOrdersRecord.orderNumber.toString(),
                                                                              "city": 'Москва',
                                                                              "date": dateTimeFormat(
                                                                                "yMMMd",
                                                                                getCurrentTimestamp,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              "companynameIsp": _model.offer?.nameCompany,
                                                                              "companynameZak": 'ООО \" ТРЭКАП\"',
                                                                              "docxTemplateUrl": _model.esmIsp?.link,
                                                                              "companyadresIsp": _model.compIsp?.companyAdress,
                                                                              "innIsp": _model.compIsp?.companyInn,
                                                                              "kppIsp": _model.compIsp?.companyKpp,
                                                                              "ogrnIsp": _model.compIsp?.companyOrgn,
                                                                              "rsIsp": _model.compIsp?.companyRs,
                                                                              "ksIsp": _model.compIsp?.companyKs,
                                                                              "bikIsp": _model.compIsp?.companyBik,
                                                                              "tsIsp": 'Na',
                                                                              "orderprice": (int.parse(containerOrdersRecord.orderPrice.toString()) - int.parse(containerOrdersRecord.orderPrice.toString()) * 20 / 120).toString(),
                                                                              "adressRabot": containerOrdersRecord.location,
                                                                              "companyAdresZak": 'Москва',
                                                                              "innZak": '9709109357',
                                                                              "kppZak": '770901001',
                                                                              "ogrnZak": 'Null',
                                                                              "rsZak": '40702810124790003930',
                                                                              "ksZak": '30101810145250000411',
                                                                              "bikZak": '044525411',
                                                                              "fioDirZak": 'Фадеев А.А',
                                                                              "fioDirIsp": _model.compIsp?.gendir,
                                                                              "qsmen": containerOrdersRecord.durationSmen.toString(),
                                                                              "startOrder": dateTimeFormat(
                                                                                "d/M H:mm",
                                                                                containerOrdersRecord.startTime,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              "bankZak": 'ФИЛИАЛ \"ЦЕНТРАЛЬНЫЙ\" БАНКА ВТБ (ПАО)',
                                                                              "rateHour": valueOrDefault<String>(
                                                                                (containerOrdersRecord.orderPrice ~/ int.parse(containerOrdersRecord.duractionTime)).toString(),
                                                                                '0',
                                                                              ),
                                                                              "companyOKPOZak": 'NA',
                                                                              "companyOKPOIsp": 'NA',
                                                                              "phoneNumberZAk": '+79774095790',
                                                                              "markTehnik": _model.offer?.tehnikaName,
                                                                              "gosnumber": _model.offer?.gosNomer,
                                                                              "hoursINSmena": containerOrdersRecord.orderHours,
                                                                              "voditelName": _model.offer?.driverName,
                                                                              "nds": valueOrDefault<String>(
                                                                                (int.parse(containerOrdersRecord.orderPrice.toString()) * 20 / 120).toString(),
                                                                                '0',
                                                                              ),
                                                                              "summNds": containerOrdersRecord.orderPrice.toString(),
                                                                              "priceOborudov": containerOrdersRecord.listArenda.isNotEmpty
                                                                                  ? ((List<int> var1) {
                                                                                      return var1.reduce((a, b) => a + b);
                                                                                    }(containerOrdersRecord.listArenda.map((e) => e.rate).toList()))
                                                                                      .toString()
                                                                                  : '0',
                                                                            });
                                                                            _model.cfNewEsm7Isp =
                                                                                SimpleReplaceInDocxCloudFunctionCallResponse(
                                                                              data: result.data,
                                                                              succeeded: true,
                                                                              resultAsString: result.data.toString(),
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
                                                                        Future(
                                                                            () async {
                                                                          try {
                                                                            final result =
                                                                                await FirebaseFunctions.instanceFor(region: 'europe-central2').httpsCallable('simpleReplaceInDocx').call({
                                                                              "orderNumber": containerOrdersRecord.orderNumber.toString(),
                                                                              "city": 'Москва',
                                                                              "date": dateTimeFormat(
                                                                                "yMMMd",
                                                                                getCurrentTimestamp,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              "companynameIsp": 'ООО \" ТРЭКАП\"',
                                                                              "companynameZak": _model.comZak?.companyName,
                                                                              "docxTemplateUrl": _model.esm7Zak?.link,
                                                                              "companyadresIsp": 'Москва, 109147 внутригородская территория (внутригородское муниципальное образование) города федерального значения муниципальный округ Таганский, ул. Марксистская, дом 20, строение 8, помещение 1/1',
                                                                              "innIsp": '9709109357',
                                                                              "kppIsp": '770901001',
                                                                              "ogrnIsp": 'NA',
                                                                              "rsIsp": '40702810124790003930',
                                                                              "ksIsp": '30101810145250000411',
                                                                              "bikIsp": '044525411',
                                                                              "tsIsp": 'NA',
                                                                              "orderprice": valueOrDefault<String>(
                                                                                (int.parse(containerOrdersRecord.orderPriceMinusNacenka.toString()) - int.parse(containerOrdersRecord.orderPriceMinusNacenka.toString()) * 20 / 120).toString(),
                                                                                '0',
                                                                              ),
                                                                              "adressRabot": containerOrdersRecord.location,
                                                                              "companyAdresZak": valueOrDefault<String>(
                                                                                _model.comZak?.companyAdress,
                                                                                'NA',
                                                                              ),
                                                                              "innZak": _model.comZak?.companyInn,
                                                                              "kppZak": _model.comZak?.companyKpp,
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
                                                                              "fioDirZak": valueOrDefault<String>(
                                                                                _model.comZak?.gendir,
                                                                                'NA',
                                                                              ),
                                                                              "fioDirIsp": 'Фадеев А. А.',
                                                                              "qsmen": containerOrdersRecord.durationSmen.toString(),
                                                                              "startOrder": dateTimeFormat(
                                                                                "d/M H:mm",
                                                                                containerOrdersRecord.startTime,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              "bankZak": valueOrDefault<String>(
                                                                                _model.comZak?.companyBank,
                                                                                'NA',
                                                                              ),
                                                                              "rateHour": valueOrDefault<String>(
                                                                                (containerOrdersRecord.orderPrice ~/ int.parse(containerOrdersRecord.durationSmen.toString())).toString(),
                                                                                '0',
                                                                              ),
                                                                              "companyOKPOZak": valueOrDefault<String>(
                                                                                _model.comZak?.companyOkpo,
                                                                                'NA',
                                                                              ),
                                                                              "companyOKPOIsp": 'NA',
                                                                              "phoneNumberZAk": containerOrdersRecord.numberOtvets,
                                                                              "markTehnik": _model.offer?.tehnikaName,
                                                                              "gosnumber": _model.offer?.gosNomer,
                                                                              "hoursINSmena": containerOrdersRecord.orderHours,
                                                                              "voditelName": _model.offer?.driverName,
                                                                              "nds": valueOrDefault<String>(
                                                                                (int.parse(containerOrdersRecord.orderPriceMinusNacenka.toString()) * 20 / 120).toString(),
                                                                                '0',
                                                                              ),
                                                                              "summNds": valueOrDefault<String>(
                                                                                containerOrdersRecord.orderPriceMinusNacenka.toString(),
                                                                                '0',
                                                                              ),
                                                                              "priceOborudov": containerOrdersRecord.listArenda.isNotEmpty
                                                                                  ? ((List<int> var1) {
                                                                                      return var1.reduce((a, b) => a + b);
                                                                                    }(containerOrdersRecord.listArenda.map((e) => e.rate).toList()))
                                                                                      .toString()
                                                                                  : '0',
                                                                            });
                                                                            _model.cfNewEsm7Zak =
                                                                                SimpleReplaceInDocxCloudFunctionCallResponse(
                                                                              data: result.data,
                                                                              succeeded: true,
                                                                              resultAsString: result.data.toString(),
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
                                                                      await Future.delayed(const Duration(
                                                                          milliseconds:
                                                                              500));
                                                                      unawaited(
                                                                        () async {
                                                                          await _model
                                                                              .collDoxs!
                                                                              .reference
                                                                              .update(createDocsRecordData(
                                                                            docEsm7Isp:
                                                                                getJsonField(
                                                                              _model.cfNewEsm7Isp?.jsonBody,
                                                                              r'''$.docxUrl''',
                                                                            ).toString(),
                                                                            docEsm7:
                                                                                getJsonField(
                                                                              _model.cfNewEsm7Zak?.jsonBody,
                                                                              r'''$.docxUrl''',
                                                                            ).toString(),
                                                                          ));
                                                                        }(),
                                                                      );
                                                                      await showDialog(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (alertDialogContext) {
                                                                          return AlertDialog(
                                                                            title:
                                                                                Text('Поздравляем!'),
                                                                            content:
                                                                                Text('Заказ успешно выполнен!'),
                                                                            actions: [
                                                                              TextButton(
                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                child: Text('Спасибо'),
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
                                                                      );
                                                                    }

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  text:
                                                                      'Подтвердить выполнение',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        42.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              'Roboto',
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Colors
                                                                          .transparent,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            6.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            if (containerOrdersRecord
                                                                    .orderStatus ==
                                                                'Завершён')
                                                              wrapWithModel(
                                                                model: _model
                                                                    .timeline2Model2,
                                                                updateCallback: () =>
                                                                    safeSetState(
                                                                        () {}),
                                                                child:
                                                                    Timeline2Widget(
                                                                  date: containerOrdersRecord
                                                                      .lastEdited!,
                                                                  header:
                                                                      'Заказ завершён',
                                                                  message:
                                                                      'Спасибо, что выбрали нас!',
                                                                  icon: Icon(
                                                                    Icons
                                                                        .flag_sharp,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .success,
                                                                    size: 24.0,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .success,
                                                                ),
                                                              ),
                                                          ].divide(SizedBox(
                                                              height: 4.0)),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
