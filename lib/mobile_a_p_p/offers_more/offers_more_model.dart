import '/backend/backend.dart';
import '/components/offer_card_widget.dart';
import '/components/order_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'offers_more_widget.dart' show OffersMoreWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OffersMoreModel extends FlutterFlowModel<OffersMoreWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for OrderCard component.
  late OrderCardModel orderCardModel;
  // Model for OfferCard component.
  late OfferCardModel offerCardModel;

  @override
  void initState(BuildContext context) {
    orderCardModel = createModel(context, () => OrderCardModel());
    offerCardModel = createModel(context, () => OfferCardModel());
  }

  @override
  void dispose() {
    orderCardModel.dispose();
    offerCardModel.dispose();
  }
}
