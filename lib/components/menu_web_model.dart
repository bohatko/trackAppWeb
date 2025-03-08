import '';
import '/auth/firebase_auth/auth_util.dart';
import '/components/menu_tab_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import '/index.dart';
import 'menu_web_widget.dart' show MenuWebWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MenuWebModel extends FlutterFlowModel<MenuWebWidget> {
  ///  Local state fields for this component.

  String selectedmenu = 'Мои заказы';

  ///  State fields for stateful widgets in this component.

  // Model for MenuTab component.
  late MenuTabModel menuTabModel1;
  // Model for MenuTab component.
  late MenuTabModel menuTabModel2;
  // Model for MenuTab component.
  late MenuTabModel menuTabModel3;
  // Model for MenuTab component.
  late MenuTabModel menuTabModel4;
  // Model for MenuTab component.
  late MenuTabModel menuTabModel5;
  // Model for MenuTab component.
  late MenuTabModel menuTabModel6;
  // Model for MenuTab component.
  late MenuTabModel menuTabModel7;
  // Model for MenuTab component.
  late MenuTabModel menuTabModel8;

  @override
  void initState(BuildContext context) {
    menuTabModel1 = createModel(context, () => MenuTabModel());
    menuTabModel2 = createModel(context, () => MenuTabModel());
    menuTabModel3 = createModel(context, () => MenuTabModel());
    menuTabModel4 = createModel(context, () => MenuTabModel());
    menuTabModel5 = createModel(context, () => MenuTabModel());
    menuTabModel6 = createModel(context, () => MenuTabModel());
    menuTabModel7 = createModel(context, () => MenuTabModel());
    menuTabModel8 = createModel(context, () => MenuTabModel());
  }

  @override
  void dispose() {
    menuTabModel1.dispose();
    menuTabModel2.dispose();
    menuTabModel3.dispose();
    menuTabModel4.dispose();
    menuTabModel5.dispose();
    menuTabModel6.dispose();
    menuTabModel7.dispose();
    menuTabModel8.dispose();
  }
}
