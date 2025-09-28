import '/auth/firebase_auth/auth_util.dart';
import '/components/menu_tab_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_web_model.dart';
export 'menu_web_model.dart';

class MenuWebWidget extends StatefulWidget {
  const MenuWebWidget({super.key});

  @override
  State<MenuWebWidget> createState() => _MenuWebWidgetState();
}

class _MenuWebWidgetState extends State<MenuWebWidget> {
  late MenuWebModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuWebModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 300.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(-1.0, 0.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/T_App_logo_08.jpg',
                width: 400.0,
                height: 80.0,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Builder(
            builder: (context) {
              if (valueOrDefault(currentUserDocument?.category, '') ==
                  'Заказчик') {
                return Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 0.0, 12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.menuTabModel1,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: MenuTabWidget(
                          nameTab: 'Мои заказы',
                          iconDefault: Icon(
                            FFIcons.ksquare3stack3dtopfilled,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          isActiv: FFAppState().menuIndexAdmin == 'Заказы'
                              ? true
                              : false,
                          iconActiv: Icon(
                            FFIcons.ksquare3stack3dtopfilled,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          onTap: () async {
                            FFAppState().menuIndexAdmin = 'Заказы';
                            safeSetState(() {});

                            context.pushNamed(MyOrdersWebZWidget.routeName);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(16.0, 40.0, 16.0, 12.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.menuTabModel2,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: MenuTabWidget(
                          nameTab: 'Заказы',
                          iconDefault: Icon(
                            FFIcons.ksquare3stack3dtopfilled,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          isActiv: FFAppState().menuIndexAdmin == 'Заказы'
                              ? true
                              : false,
                          iconActiv: Icon(
                            FFIcons.ksquare3stack3dtopfilled,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          onTap: () async {
                            FFAppState().menuIndexAdmin = 'Заказы';
                            safeSetState(() {});

                            context.pushNamed(OrdersWebIWidget.routeName);
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.menuTabModel3,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: MenuTabWidget(
                          nameTab: 'Мои проекты',
                          iconDefault: Icon(
                            FFIcons.kcalendardaytimelinetrailing,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          isActiv: FFAppState().menuIndexAdmin == 'Мои проекты'
                              ? true
                              : false,
                          iconActiv: Icon(
                            FFIcons.kcalendardaytimelinetrailing,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          onTap: () async {
                            FFAppState().menuIndexAdmin = 'Мои проекты';
                            safeSetState(() {});

                            context.pushNamed(ProjectsIWidget.routeName);
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.menuTabModel4,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: MenuTabWidget(
                          nameTab: 'Техника & Оборудование',
                          iconDefault: Icon(
                            FFIcons.kbusdoubledeckerfill,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          isActiv: FFAppState().menuIndexAdmin ==
                                  'Техника & Оборудование'
                              ? true
                              : false,
                          iconActiv: Icon(
                            FFIcons.kbusdoubledeckerfill,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          onTap: () async {
                            FFAppState().menuIndexAdmin =
                                'Техника & Оборудование';
                            safeSetState(() {});

                            context.pushNamed(
                                MyTehnikAndOborudWebWidget.routeName);
                          },
                        ),
                      ),
                      wrapWithModel(
                        model: _model.menuTabModel5,
                        updateCallback: () => safeSetState(() {}),
                        updateOnChange: true,
                        child: MenuTabWidget(
                          nameTab: 'Сотрудники',
                          iconDefault: Icon(
                            FFIcons.kpersonfillviewfinder,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                          isActiv: FFAppState().menuIndexAdmin == 'Сотрудники'
                              ? true
                              : false,
                          iconActiv: Icon(
                            FFIcons.kpersonfillviewfinder,
                            color: FlutterFlowTheme.of(context).primary,
                            size: 24.0,
                          ),
                          onTap: () async {
                            FFAppState().menuIndexAdmin = 'Сотрудники';
                            safeSetState(() {});

                            context.pushNamed(MyEmployersWebWidget.routeName);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
            child: wrapWithModel(
              model: _model.menuTabModel6,
              updateCallback: () => safeSetState(() {}),
              updateOnChange: true,
              child: MenuTabWidget(
                nameTab: 'Ответы на частые вопросы',
                iconDefault: Icon(
                  FFIcons.kquestionmarkcircle,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                isActiv:
                    FFAppState().menuIndexAdmin == 'Ответы на частые вопросы'
                        ? true
                        : false,
                iconActiv: Icon(
                  FFIcons.kquestionmarkcircle,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
                onTap: () async {
                  FFAppState().menuIndexAdmin = 'Ответы на частые вопросы';
                  safeSetState(() {});

                  context.pushNamed(AnsversWebWidget.routeName);
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: wrapWithModel(
              model: _model.menuTabModel7,
              updateCallback: () => safeSetState(() {}),
              updateOnChange: true,
              child: MenuTabWidget(
                nameTab: 'Поддержка',
                iconDefault: Icon(
                  FFIcons.kheadphones,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                isActiv:
                    FFAppState().menuIndexAdmin == 'Поддержка' ? true : false,
                iconActiv: Icon(
                  FFIcons.kheadphones,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
                onTap: () async {
                  FFAppState().menuIndexAdmin = 'Поддержка';
                  safeSetState(() {});

                  context.pushNamed(SupportWebWidget.routeName);
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
            child: wrapWithModel(
              model: _model.menuTabModel8,
              updateCallback: () => safeSetState(() {}),
              updateOnChange: true,
              child: MenuTabWidget(
                nameTab: 'Договор oферты',
                iconDefault: Icon(
                  Icons.document_scanner,
                  color: FlutterFlowTheme.of(context).primaryText,
                  size: 24.0,
                ),
                isActiv:
                    FFAppState().menuIndexAdmin == 'Офферта' ? true : false,
                iconActiv: Icon(
                  Icons.document_scanner,
                  color: FlutterFlowTheme.of(context).primary,
                  size: 24.0,
                ),
                onTap: () async {
                  FFAppState().menuIndexAdmin = 'Офферта';
                  safeSetState(() {});

                  context.pushNamed(OfertaWebWidget.routeName);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
