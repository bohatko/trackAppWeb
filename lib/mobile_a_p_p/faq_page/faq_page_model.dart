import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/mobile_a_p_p/components/navigate_menu/navigate_menu_widget.dart';
import 'dart:ui';
import 'faq_page_widget.dart' show FaqPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FaqPageModel extends FlutterFlowModel<FaqPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Navigate_menu component.
  late NavigateMenuModel navigateMenuModel;

  @override
  void initState(BuildContext context) {
    navigateMenuModel = createModel(context, () => NavigateMenuModel());
  }

  @override
  void dispose() {
    navigateMenuModel.dispose();
  }
}
