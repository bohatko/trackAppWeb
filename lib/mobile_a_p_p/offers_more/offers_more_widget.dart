import '/backend/backend.dart';
import '/components/offer_card_widget.dart';
import '/components/order_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'offers_more_model.dart';
export 'offers_more_model.dart';

class OffersMoreWidget extends StatefulWidget {
  const OffersMoreWidget({
    super.key,
    required this.orderDoc,
    required this.oFFerDoc,
  });

  final OrdersRecord? orderDoc;
  final DocumentReference? oFFerDoc;

  static String routeName = 'Offers_more';
  static String routePath = 'offersMore';

  @override
  State<OffersMoreWidget> createState() => _OffersMoreWidgetState();
}

class _OffersMoreWidgetState extends State<OffersMoreWidget> {
  late OffersMoreModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OffersMoreModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: !isWeb
            ? AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primary,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30.0,
                  borderWidth: 1.0,
                  buttonSize: 60.0,
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  onPressed: () async {
                    context.safePop();
                  },
                ),
                title: Text(
                  'Подробности отклика',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        fontFamily: 'Roboto',
                        color: Colors.white,
                        fontSize: 20.0,
                        letterSpacing: 0.0,
                      ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 2.0,
              )
            : null,
        body: SafeArea(
          top: true,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 600.0,
            ),
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  wrapWithModel(
                    model: _model.orderCardModel,
                    updateCallback: () => safeSetState(() {}),
                    child: OrderCardWidget(
                      adresOrder: widget!.orderDoc!.location,
                      priceOrder: widget!.orderDoc!.orderPrice,
                      discriptionOrder: widget!.orderDoc!.description,
                      numberOrder: widget!.orderDoc!.orderNumber,
                      budgetOrder:
                          widget!.orderDoc!.orderPriceMinusNacenka.toString(),
                      tehnikaOrder: widget!.orderDoc?.typeTehnik,
                      statusOrder: widget!.orderDoc?.orderStatus,
                      datettimeOrder: widget!.orderDoc!.startTime!,
                      orderGeo: widget!.orderDoc!.orderGeo!,
                      driverGeo: widget!.orderDoc?.draverGeo,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 4.0, 4.0),
                    child: wrapWithModel(
                      model: _model.offerCardModel,
                      updateCallback: () => safeSetState(() {}),
                      child: OfferCardWidget(
                        offerDoc: widget!.oFFerDoc!,
                        orderRef: widget!.orderDoc!.reference,
                        statusOrder: widget!.orderDoc!.orderStatus,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
