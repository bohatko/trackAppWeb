import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'menu_tab_model.dart';
export 'menu_tab_model.dart';

class MenuTabWidget extends StatefulWidget {
  const MenuTabWidget({
    super.key,
    String? nameTab,
    required this.iconDefault,
    bool? isActiv,
    required this.iconActiv,
    required this.onTap,
  })  : this.nameTab = nameTab ?? '',
        this.isActiv = isActiv ?? false;

  final String nameTab;
  final Widget? iconDefault;
  final bool isActiv;
  final Widget? iconActiv;
  final Future Function()? onTap;

  @override
  State<MenuTabWidget> createState() => _MenuTabWidgetState();
}

class _MenuTabWidgetState extends State<MenuTabWidget> {
  late MenuTabModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuTabModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        await widget.onTap?.call();
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 52.0,
        decoration: BoxDecoration(
          color: widget!.isActiv == true
              ? Color(0xFFF9F9FB)
              : FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  if (widget!.isActiv == false)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: widget!.iconDefault!,
                    ),
                  if (widget!.isActiv == true)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: widget!.iconActiv!,
                    ),
                ],
              ),
              Text(
                widget!.nameTab,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Roboto',
                      color: widget!.isActiv == true
                          ? FlutterFlowTheme.of(context).primary
                          : FlutterFlowTheme.of(context).primaryText,
                      letterSpacing: 0.0,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
