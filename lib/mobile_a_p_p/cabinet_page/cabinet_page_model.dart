import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/mobile_a_p_p/components/navigate_menu/navigate_menu_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'cabinet_page_widget.dart' show CabinetPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CabinetPageModel extends FlutterFlowModel<CabinetPageWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadDataKr0 = false;
  FFUploadedFile uploadedLocalFile_uploadDataKr0 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataKr0 = '';

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
