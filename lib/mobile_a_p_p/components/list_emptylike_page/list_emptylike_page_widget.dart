import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'list_emptylike_page_model.dart';
export 'list_emptylike_page_model.dart';

class ListEmptylikePageWidget extends StatefulWidget {
  const ListEmptylikePageWidget({super.key});

  @override
  State<ListEmptylikePageWidget> createState() =>
      _ListEmptylikePageWidgetState();
}

class _ListEmptylikePageWidgetState extends State<ListEmptylikePageWidget> {
  late ListEmptylikePageModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListEmptylikePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Lottie.asset(
          'assets/jsons/Animation_-_1705242311533.json',
          width: 150.0,
          height: 130.0,
          fit: BoxFit.cover,
          animate: true,
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Text(
            'Список пуст',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Roboto',
                  letterSpacing: 0.0,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
          child: Text(
            'У Вас нет ничего в избранном!',
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Roboto',
                  letterSpacing: 0.0,
                ),
          ),
        ),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
          child: FFButtonWidget(
            onPressed: () async {
              context.pushNamed(HomePageWidget.routeName);
            },
            text: 'Искать ',
            options: FFButtonOptions(
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
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
            showLoadingIndicator: false,
          ),
        ),
      ],
    );
  }
}
