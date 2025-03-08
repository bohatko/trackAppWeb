import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/alert_map_widget.dart';
import '/components/header_widget.dart';
import '/components/list_all_dopoborud_widget.dart';
import '/components/list_all_tekhnik_widget.dart';
import '/components/menu_web_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'new_orders_web_widget.dart' show NewOrdersWebWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class NewOrdersWebModel extends FlutterFlowModel<NewOrdersWebWidget> {
  ///  Local state fields for this page.

  int selectedHour = 0;

  ///  State fields for stateful widgets in this page.

  // Model for menuWeb component.
  late MenuWebModel menuWebModel;
  // Model for Header component.
  late HeaderModel headerModel;
  // State field(s) for phoneNumber widget.
  FocusNode? phoneNumberFocusNode;
  TextEditingController? phoneNumberTextController;
  final phoneNumberMask = MaskTextInputFormatter(mask: '+# (###) ###-##-##');
  String? Function(BuildContext, String?)? phoneNumberTextControllerValidator;
  // State field(s) for discription_order widget.
  FocusNode? discriptionOrderFocusNode;
  TextEditingController? discriptionOrderTextController;
  String? Function(BuildContext, String?)?
      discriptionOrderTextControllerValidator;
  DateTime? datePicked;
  // State field(s) for countSmen widget.
  FocusNode? countSmenFocusNode;
  TextEditingController? countSmenTextController;
  String? Function(BuildContext, String?)? countSmenTextControllerValidator;
  // State field(s) for hours widget.
  String? hoursValue;
  FormFieldController<String>? hoursValueController;
  // State field(s) for need_doc widget.
  bool? needDocValue;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  int? countOrderWeb;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  UsersRecord? managerWeb;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  OrdersRecord? createdOrderWeb;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  CompanyRecord? companyZ;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatsRecord? chatWeb;

  @override
  void initState(BuildContext context) {
    menuWebModel = createModel(context, () => MenuWebModel());
    headerModel = createModel(context, () => HeaderModel());
  }

  @override
  void dispose() {
    menuWebModel.dispose();
    headerModel.dispose();
    phoneNumberFocusNode?.dispose();
    phoneNumberTextController?.dispose();

    discriptionOrderFocusNode?.dispose();
    discriptionOrderTextController?.dispose();

    countSmenFocusNode?.dispose();
    countSmenTextController?.dispose();
  }
}
