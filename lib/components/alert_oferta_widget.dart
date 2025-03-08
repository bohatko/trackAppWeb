import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_pdf_viewer.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'alert_oferta_model.dart';
export 'alert_oferta_model.dart';

class AlertOfertaWidget extends StatefulWidget {
  const AlertOfertaWidget({super.key});

  @override
  State<AlertOfertaWidget> createState() => _AlertOfertaWidgetState();
}

class _AlertOfertaWidgetState extends State<AlertOfertaWidget> {
  late AlertOfertaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertOfertaModel());

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
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.35,
        height: MediaQuery.sizeOf(context).height * 0.9,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  if (valueOrDefault(currentUserDocument?.category, '') ==
                      'Заказчик')
                    AuthUserStreamWidget(
                      builder: (context) => FlutterFlowPdfViewer(
                        assetPath: 'assets/pdfs/__(2).pdf',
                        height: 626.0,
                        horizontalScroll: false,
                      ),
                    ),
                  if (valueOrDefault(currentUserDocument?.category, '') ==
                      'Исполнитель')
                    AuthUserStreamWidget(
                      builder: (context) => FlutterFlowPdfViewer(
                        assetPath: 'assets/pdfs/__(2).pdf',
                        height: 626.0,
                        horizontalScroll: false,
                      ),
                    ),
                ],
              ),
              if (valueOrDefault<bool>(
                      currentUserDocument?.docAfferta, false) ==
                  false)
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: AuthUserStreamWidget(
                    builder: (context) => Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            unselectedWidgetColor:
                                FlutterFlowTheme.of(context).secondaryText,
                          ),
                          child: Checkbox(
                            value: _model.checkboxValue ??= false,
                            onChanged: (newValue) async {
                              safeSetState(
                                  () => _model.checkboxValue = newValue!);
                            },
                            side: BorderSide(
                              width: 2,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            activeColor: FlutterFlowTheme.of(context).primary,
                            checkColor: FlutterFlowTheme.of(context).info,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Я прочитал(а) договор',
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
                ),
              Stack(
                children: [
                  if (valueOrDefault<bool>(
                          currentUserDocument?.docAfferta, false) ==
                      false)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 20.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                GoRouter.of(context).prepareAuthEvent();
                                await authManager.signOut();
                                GoRouter.of(context).clearRedirectLocation();

                                context.goNamedAuth(
                                    LoginWebWidget.routeName, context.mounted);
                              },
                              text: 'Отказаться',
                              options: FFButtonOptions(
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
                            Opacity(
                              opacity: _model.checkboxValue == true ? 1.0 : 0.7,
                              child: FFButtonWidget(
                                onPressed: () async {
                                  if (_model.checkboxValue == true) {
                                    await currentUserReference!
                                        .update(createUsersRecordData(
                                      docAfferta: true,
                                    ));

                                    context
                                        .goNamed(SplashGlobalWidget.routeName);
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return AlertDialog(
                                          title: Text('Не успешно!'),
                                          content: Text(
                                              'Сначала подпишите договор оферты!'),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  alertDialogContext),
                                              child: Text('Понятно'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                    return;
                                  }
                                },
                                text: 'Принять оферту',
                                options: FFButtonOptions(
                                  height: 35.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 12.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).success,
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
                            FFButtonWidget(
                              onPressed: () async {
                                await downloadFile(
                                  filename: _model.docName,
                                  url: valueOrDefault(
                                              currentUserDocument?.category,
                                              '') ==
                                          'Заказчик'
                                      ? 'https://firebasestorage.googleapis.com/v0/b/track-app-uxjczg.appspot.com/o/documents%2F%D0%BE%D1%84%D0%B5%D1%80%D1%82%D0%B0_%D0%B7%D0%B0%D0%BA%D0%B0%D0%B7%D1%87%D0%B8%D0%BA.pdf?alt=media&token=c313e328-5bdf-48d6-aa25-088da0f69deb'
                                      : 'https://firebasestorage.googleapis.com/v0/b/track-app-uxjczg.appspot.com/o/documents%2F%D0%BE%D1%84%D0%B5%D1%80%D1%82%D0%B0_%D0%B2%D0%BB%D0%B0%D0%B4%D0%B5%D0%BB%D0%B5%D1%86.pdf?alt=media&token=6cc7ddf1-0067-46aa-a2a5-4a41b048a507',
                                );
                              },
                              text: 'Скачать договор',
                              options: FFButtonOptions(
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
                          ].divide(SizedBox(width: 12.0)),
                        ),
                      ),
                    ),
                  if (valueOrDefault<bool>(
                          currentUserDocument?.docAfferta, false) ==
                      true)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                      child: AuthUserStreamWidget(
                        builder: (context) => Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Color(0xFFD1ECDD),
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              color: Color(0xFF1AA053),
                            ),
                          ),
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Icon(
                                  Icons.done_outline,
                                  color: Color(0xFF1AA053),
                                  size: 24.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Вы уже подписали договор!',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Roboto',
                                        color: Color(0xFF1AA053),
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
