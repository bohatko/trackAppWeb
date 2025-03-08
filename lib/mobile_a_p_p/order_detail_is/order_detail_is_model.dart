import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/custom_cloud_functions/custom_cloud_function_response_manager.dart';
import '/backend/schema/structs/index.dart';
import '/components/document_componet_widget.dart';
import '/components/order_card_widget.dart';
import '/components/timelaps_widget.dart';
import '/components/timeline2_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'order_detail_is_widget.dart' show OrderDetailIsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderDetailIsModel extends FlutterFlowModel<OrderDetailIsWidget> {
  ///  Local state fields for this page.

  bool work = false;

  ///  State fields for stateful widgets in this page.

  // Model for OrderCard component.
  late OrderCardModel orderCardModel;
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

  @override
  void initState(BuildContext context) {
    orderCardModel = createModel(context, () => OrderCardModel());
    timeline2Model1 = createModel(context, () => Timeline2Model());
    timelapsModel1 = createModel(context, () => TimelapsModel());
    documentComponetModel1 =
        createModel(context, () => DocumentComponetModel());
    timelapsModel2 = createModel(context, () => TimelapsModel());
    timelapsModel3 = createModel(context, () => TimelapsModel());
    documentComponetModel2 =
        createModel(context, () => DocumentComponetModel());
    timeline2Model2 = createModel(context, () => Timeline2Model());
  }

  @override
  void dispose() {
    orderCardModel.dispose();
    timeline2Model1.dispose();
    timelapsModel1.dispose();
    documentComponetModel1.dispose();
    timelapsModel2.dispose();
    timelapsModel3.dispose();
    documentComponetModel2.dispose();
    timeline2Model2.dispose();
  }
}
