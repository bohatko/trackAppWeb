import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'haha_model.dart';
export 'haha_model.dart';

class HahaWidget extends StatefulWidget {
  const HahaWidget({super.key});

  @override
  State<HahaWidget> createState() => _HahaWidgetState();
}

class _HahaWidgetState extends State<HahaWidget> {
  late HahaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HahaModel());

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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Lottie.asset(
              'assets/jsons/office-person-raising-both-hands.json',
              width: 200.0,
              height: 200.0,
              fit: BoxFit.cover,
              animate: true,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
            child: Text(
              'У вас еще нет ',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                    fontFamily: 'Roboto',
                    letterSpacing: 0.0,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
