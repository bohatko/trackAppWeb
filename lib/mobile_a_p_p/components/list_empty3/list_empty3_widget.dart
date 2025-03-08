import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'list_empty3_model.dart';
export 'list_empty3_model.dart';

class ListEmpty3Widget extends StatefulWidget {
  const ListEmpty3Widget({super.key});

  @override
  State<ListEmpty3Widget> createState() => _ListEmpty3WidgetState();
}

class _ListEmpty3WidgetState extends State<ListEmpty3Widget> {
  late ListEmpty3Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListEmpty3Model());

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
            'Ещё ничего нет',
            style: FlutterFlowTheme.of(context).labelMedium.override(
                  fontFamily: 'Roboto',
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ],
    );
  }
}
