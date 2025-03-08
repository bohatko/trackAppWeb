import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/alert_oferta_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'dart:ui';
import '/index.dart';
import 'alert_create_company_widget.dart' show AlertCreateCompanyWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AlertCreateCompanyModel
    extends FlutterFlowModel<AlertCreateCompanyWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for number widget.
  FocusNode? numberFocusNode;
  TextEditingController? numberTextController;
  String? Function(BuildContext, String?)? numberTextControllerValidator;
  String? _numberTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    return null;
  }

  // State field(s) for yourLastName widget.
  FocusNode? yourLastNameFocusNode;
  TextEditingController? yourLastNameTextController;
  String? Function(BuildContext, String?)? yourLastNameTextControllerValidator;
  String? _yourLastNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    return null;
  }

  // State field(s) for yourFirstName widget.
  FocusNode? yourFirstNameFocusNode;
  TextEditingController? yourFirstNameTextController;
  String? Function(BuildContext, String?)? yourFirstNameTextControllerValidator;
  String? _yourFirstNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    return null;
  }

  // State field(s) for fio widget.
  FocusNode? fioFocusNode;
  TextEditingController? fioTextController;
  String? Function(BuildContext, String?)? fioTextControllerValidator;
  String? _fioTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    return null;
  }

  // State field(s) for company_name widget.
  FocusNode? companyNameFocusNode;
  TextEditingController? companyNameTextController;
  String? Function(BuildContext, String?)? companyNameTextControllerValidator;
  String? _companyNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    return null;
  }

  // State field(s) for adress widget.
  FocusNode? adressFocusNode;
  TextEditingController? adressTextController;
  String? Function(BuildContext, String?)? adressTextControllerValidator;
  String? _adressTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    return null;
  }

  // State field(s) for inn widget.
  FocusNode? innFocusNode;
  TextEditingController? innTextController;
  String? Function(BuildContext, String?)? innTextControllerValidator;
  String? _innTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    return null;
  }

  // State field(s) for kpp widget.
  FocusNode? kppFocusNode;
  TextEditingController? kppTextController;
  String? Function(BuildContext, String?)? kppTextControllerValidator;
  String? _kppTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    return null;
  }

  // State field(s) for ogrn widget.
  FocusNode? ogrnFocusNode;
  TextEditingController? ogrnTextController;
  String? Function(BuildContext, String?)? ogrnTextControllerValidator;
  String? _ogrnTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    return null;
  }

  // State field(s) for okpo widget.
  FocusNode? okpoFocusNode;
  TextEditingController? okpoTextController;
  String? Function(BuildContext, String?)? okpoTextControllerValidator;
  String? _okpoTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    return null;
  }

  // State field(s) for name_bank widget.
  FocusNode? nameBankFocusNode;
  TextEditingController? nameBankTextController;
  String? Function(BuildContext, String?)? nameBankTextControllerValidator;
  String? _nameBankTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    return null;
  }

  // State field(s) for bik widget.
  FocusNode? bikFocusNode;
  TextEditingController? bikTextController;
  String? Function(BuildContext, String?)? bikTextControllerValidator;
  String? _bikTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    return null;
  }

  // State field(s) for rs widget.
  FocusNode? rsFocusNode;
  TextEditingController? rsTextController;
  String? Function(BuildContext, String?)? rsTextControllerValidator;
  String? _rsTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    return null;
  }

  // State field(s) for ks widget.
  FocusNode? ksFocusNode;
  TextEditingController? ksTextController;
  String? Function(BuildContext, String?)? ksTextControllerValidator;
  String? _ksTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Обязательное поле!';
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CompanyRecord? createdCompany;

  @override
  void initState(BuildContext context) {
    numberTextControllerValidator = _numberTextControllerValidator;
    yourLastNameTextControllerValidator = _yourLastNameTextControllerValidator;
    yourFirstNameTextControllerValidator =
        _yourFirstNameTextControllerValidator;
    fioTextControllerValidator = _fioTextControllerValidator;
    companyNameTextControllerValidator = _companyNameTextControllerValidator;
    adressTextControllerValidator = _adressTextControllerValidator;
    innTextControllerValidator = _innTextControllerValidator;
    kppTextControllerValidator = _kppTextControllerValidator;
    ogrnTextControllerValidator = _ogrnTextControllerValidator;
    okpoTextControllerValidator = _okpoTextControllerValidator;
    nameBankTextControllerValidator = _nameBankTextControllerValidator;
    bikTextControllerValidator = _bikTextControllerValidator;
    rsTextControllerValidator = _rsTextControllerValidator;
    ksTextControllerValidator = _ksTextControllerValidator;
  }

  @override
  void dispose() {
    numberFocusNode?.dispose();
    numberTextController?.dispose();

    yourLastNameFocusNode?.dispose();
    yourLastNameTextController?.dispose();

    yourFirstNameFocusNode?.dispose();
    yourFirstNameTextController?.dispose();

    fioFocusNode?.dispose();
    fioTextController?.dispose();

    companyNameFocusNode?.dispose();
    companyNameTextController?.dispose();

    adressFocusNode?.dispose();
    adressTextController?.dispose();

    innFocusNode?.dispose();
    innTextController?.dispose();

    kppFocusNode?.dispose();
    kppTextController?.dispose();

    ogrnFocusNode?.dispose();
    ogrnTextController?.dispose();

    okpoFocusNode?.dispose();
    okpoTextController?.dispose();

    nameBankFocusNode?.dispose();
    nameBankTextController?.dispose();

    bikFocusNode?.dispose();
    bikTextController?.dispose();

    rsFocusNode?.dispose();
    rsTextController?.dispose();

    ksFocusNode?.dispose();
    ksTextController?.dispose();
  }
}
