import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/components/document_componet_widget.dart';
import '/components/header_widget.dart';
import '/components/menu_web_widget.dart';
import '/components/timelaps_widget.dart';
import '/components/timeline2_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/web/alert_add_offer/alert_add_offer_widget.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'otklik_orders_i_widget.dart' show OtklikOrdersIWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:octo_image/octo_image.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class OtklikOrdersIModel extends FlutterFlowModel<OtklikOrdersIWidget> {
  ///  Local state fields for this page.

  bool work = false;

  ///  State fields for stateful widgets in this page.

  // Model for menuWeb component.
  late MenuWebModel menuWebModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  TehnikaRecord? tehnikaColll;
  // State field(s) for Column widget.
  ScrollController? columnController3;
  // Model for Timeline2 component.
  late Timeline2Model timeline2Model1;
  // Model for Timelaps component.
  late TimelapsModel timelapsModel1;
  // Model for DocumentComponet component.
  late DocumentComponetModel documentComponetModel1;
  // Stores action output result for [Firestore Query - Query a collection] action in DocumentComponet widget.
  DocsRecord? docss44;
  // Model for Timelaps component.
  late TimelapsModel timelapsModel2;
  // Model for Timelaps component.
  late TimelapsModel timelapsModel3;
  // Model for DocumentComponet component.
  late DocumentComponetModel documentComponetModel2;
  // Stores action output result for [Firestore Query - Query a collection] action in DocumentComponet widget.
  DocsRecord? docss;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  OffersRecord? offer;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  DocsRecord? collDoxs;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  DocumentsRecord? esmIsp;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  DocumentsRecord? esm7Zak;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyRecord? compIsp;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyRecord? comZak;
  // Stores action output result for [Cloud Function - simpleReplaceInDocx] action in Button widget.
  SimpleReplaceInDocxCloudFunctionCallResponse? cfNewEsm7Isp;
  // Stores action output result for [Cloud Function - simpleReplaceInDocx] action in Button widget.
  SimpleReplaceInDocxCloudFunctionCallResponse? cfNewEsm7Zak;
  // Model for Timeline2 component.
  late Timeline2Model timeline2Model2;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    menuWebModel = createModel(context, () => MenuWebModel());
    headerModel = createModel(context, () => HeaderModel());
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    columnController3 = ScrollController();
    timeline2Model1 = createModel(context, () => Timeline2Model());
    timelapsModel1 = createModel(context, () => TimelapsModel());
    documentComponetModel1 =
        createModel(context, () => DocumentComponetModel());
    timelapsModel2 = createModel(context, () => TimelapsModel());
    timelapsModel3 = createModel(context, () => TimelapsModel());
    documentComponetModel2 =
        createModel(context, () => DocumentComponetModel());
    timeline2Model2 = createModel(context, () => Timeline2Model());
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    menuWebModel.dispose();
    headerModel.dispose();
    columnController1?.dispose();
    columnController2?.dispose();
    columnController3?.dispose();
    timeline2Model1.dispose();
    timelapsModel1.dispose();
    documentComponetModel1.dispose();
    timelapsModel2.dispose();
    timelapsModel3.dispose();
    documentComponetModel2.dispose();
    timeline2Model2.dispose();
    listViewController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
