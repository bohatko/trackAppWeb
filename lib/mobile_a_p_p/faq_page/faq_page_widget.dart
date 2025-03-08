import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/mobile_a_p_p/components/navigate_menu/navigate_menu_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'faq_page_model.dart';
export 'faq_page_model.dart';

class FaqPageWidget extends StatefulWidget {
  const FaqPageWidget({super.key});

  static String routeName = 'Faq_page';
  static String routePath = 'faqPage';

  @override
  State<FaqPageWidget> createState() => _FaqPageWidgetState();
}

class _FaqPageWidgetState extends State<FaqPageWidget> {
  late FaqPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FaqPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.navigateMenuModel,
            updateCallback: () => safeSetState(() {}),
            child: NavigateMenuWidget(),
          ),
        ),
        appBar: isWeb
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.menu_open,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    scaffoldKey.currentState!.openDrawer();
                  },
                ),
                title: Text(
                  'FAQ',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontSize: 22.0,
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Ответы на вопросы',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Roboto',
                        letterSpacing: 0.0,
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
