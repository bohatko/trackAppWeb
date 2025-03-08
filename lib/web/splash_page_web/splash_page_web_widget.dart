import '';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/alert_create_company_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'splash_page_web_model.dart';
export 'splash_page_web_model.dart';

class SplashPageWebWidget extends StatefulWidget {
  const SplashPageWebWidget({
    super.key,
    required this.number,
  });

  final String? number;

  static String routeName = 'SplashPage_web';
  static String routePath = 'splashPageWeb';

  @override
  State<SplashPageWebWidget> createState() => _SplashPageWebWidgetState();
}

class _SplashPageWebWidgetState extends State<SplashPageWebWidget> {
  late SplashPageWebModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashPageWebModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      GoRouter.of(context).prepareAuthEvent();
      if (_model.pass != _model.pass) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Пароли не совпадают',
            ),
          ),
        );
        return;
      }

      final user = await authManager.createAccountWithEmail(
        context,
        '7${widget!.number}@track-app.ru',
        _model.pass,
      );
      if (user == null) {
        return;
      }

      await UsersRecord.collection.doc(user.uid).update(createUsersRecordData(
            email: '7${functions.onlyNumber(widget!.number)}@track-app.ru',
            category: FFAppState().signUpCategory,
            photoUrl:
                'https://firebasestorage.googleapis.com/v0/b/track-app-uxjczg.appspot.com/o/01.png?alt=media&token=1e4d125a-ef25-4922-ba69-a17c426acd6a',
            phoneNumber: '7${functions.onlyNumber(widget!.number)}',
            status: 'Активный',
            displayName: 'Гость',
            createdTime: getCurrentTimestamp,
            docAfferta: false,
          ));

      await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(dialogContext).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: AlertCreateCompanyWidget(
                number: widget!.number!,
              ),
            ),
          );
        },
      );

      context.goNamedAuth(SplashGlobalWidget.routeName, context.mounted);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/T_App_logo_09.png',
                    width: 270.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
