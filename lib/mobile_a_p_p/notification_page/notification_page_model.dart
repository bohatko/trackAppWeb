import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/mobile_a_p_p/components/list_empty2/list_empty2_widget.dart';
import '/mobile_a_p_p/components/navigate_menu/navigate_menu_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'notification_page_widget.dart' show NotificationPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class NotificationPageModel extends FlutterFlowModel<NotificationPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Model for Navigate_menu component.
  late NavigateMenuModel navigateMenuModel;

  @override
  void initState(BuildContext context) {
    navigateMenuModel = createModel(context, () => NavigateMenuModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    navigateMenuModel.dispose();
  }
}
