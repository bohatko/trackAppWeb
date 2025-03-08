import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'create_company_widget.dart' show CreateCompanyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CreateCompanyModel extends FlutterFlowModel<CreateCompanyWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for number widget.
  FocusNode? numberFocusNode;
  TextEditingController? numberTextController;
  String? Function(BuildContext, String?)? numberTextControllerValidator;
  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode1;
  TextEditingController? yourNameTextController1;
  String? Function(BuildContext, String?)? yourNameTextController1Validator;
  String? _yourNameTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for yourNamelast widget.
  FocusNode? yourNamelastFocusNode1;
  TextEditingController? yourNamelastTextController1;
  String? Function(BuildContext, String?)? yourNamelastTextController1Validator;
  String? _yourNamelastTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    if (val.length < 2) {
      return 'Requires at least 2 characters.';
    }

    return null;
  }

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode2;
  TextEditingController? yourNameTextController2;
  String? Function(BuildContext, String?)? yourNameTextController2Validator;
  String? _yourNameTextController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode3;
  TextEditingController? yourNameTextController3;
  String? Function(BuildContext, String?)? yourNameTextController3Validator;
  String? _yourNameTextController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    return null;
  }

  // State field(s) for yourName widget.
  FocusNode? yourNameFocusNode4;
  TextEditingController? yourNameTextController4;
  String? Function(BuildContext, String?)? yourNameTextController4Validator;
  String? _yourNameTextController4Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for yourNamelast widget.
  FocusNode? yourNamelastFocusNode2;
  TextEditingController? yourNamelastTextController2;
  String? Function(BuildContext, String?)? yourNamelastTextController2Validator;
  String? _yourNamelastTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for city widget.
  FocusNode? cityFocusNode1;
  TextEditingController? cityTextController1;
  String? Function(BuildContext, String?)? cityTextController1Validator;
  String? _cityTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for city widget.
  FocusNode? cityFocusNode2;
  TextEditingController? cityTextController2;
  String? Function(BuildContext, String?)? cityTextController2Validator;
  String? _cityTextController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    return null;
  }

  // State field(s) for okpo widget.
  FocusNode? okpoFocusNode;
  TextEditingController? okpoTextController;
  String? Function(BuildContext, String?)? okpoTextControllerValidator;
  // State field(s) for city widget.
  FocusNode? cityFocusNode3;
  TextEditingController? cityTextController3;
  String? Function(BuildContext, String?)? cityTextController3Validator;
  String? _cityTextController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for city widget.
  FocusNode? cityFocusNode4;
  TextEditingController? cityTextController4;
  String? Function(BuildContext, String?)? cityTextController4Validator;
  String? _cityTextController4Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for city widget.
  FocusNode? cityFocusNode5;
  TextEditingController? cityTextController5;
  String? Function(BuildContext, String?)? cityTextController5Validator;
  String? _cityTextController5Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for city widget.
  FocusNode? cityFocusNode6;
  TextEditingController? cityTextController6;
  String? Function(BuildContext, String?)? cityTextController6Validator;
  String? _cityTextController6Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyRecord? createdCompany;

  @override
  void initState(BuildContext context) {
    yourNameTextController1Validator = _yourNameTextController1Validator;
    yourNamelastTextController1Validator =
        _yourNamelastTextController1Validator;
    yourNameTextController2Validator = _yourNameTextController2Validator;
    yourNameTextController3Validator = _yourNameTextController3Validator;
    yourNameTextController4Validator = _yourNameTextController4Validator;
    yourNamelastTextController2Validator =
        _yourNamelastTextController2Validator;
    cityTextController1Validator = _cityTextController1Validator;
    cityTextController2Validator = _cityTextController2Validator;
    cityTextController3Validator = _cityTextController3Validator;
    cityTextController4Validator = _cityTextController4Validator;
    cityTextController5Validator = _cityTextController5Validator;
    cityTextController6Validator = _cityTextController6Validator;
  }

  @override
  void dispose() {
    numberFocusNode?.dispose();
    numberTextController?.dispose();

    yourNameFocusNode1?.dispose();
    yourNameTextController1?.dispose();

    yourNamelastFocusNode1?.dispose();
    yourNamelastTextController1?.dispose();

    yourNameFocusNode2?.dispose();
    yourNameTextController2?.dispose();

    yourNameFocusNode3?.dispose();
    yourNameTextController3?.dispose();

    yourNameFocusNode4?.dispose();
    yourNameTextController4?.dispose();

    yourNamelastFocusNode2?.dispose();
    yourNamelastTextController2?.dispose();

    cityFocusNode1?.dispose();
    cityTextController1?.dispose();

    cityFocusNode2?.dispose();
    cityTextController2?.dispose();

    okpoFocusNode?.dispose();
    okpoTextController?.dispose();

    cityFocusNode3?.dispose();
    cityTextController3?.dispose();

    cityFocusNode4?.dispose();
    cityTextController4?.dispose();

    cityFocusNode5?.dispose();
    cityTextController5?.dispose();

    cityFocusNode6?.dispose();
    cityTextController6?.dispose();
  }
}
