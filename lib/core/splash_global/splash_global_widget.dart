import '';
import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'splash_global_model.dart';
export 'splash_global_model.dart';

class SplashGlobalWidget extends StatefulWidget {
  const SplashGlobalWidget({super.key});

  static String routeName = 'SplashGlobal';
  static String routePath = 'splash_gobal';

  @override
  State<SplashGlobalWidget> createState() => _SplashGlobalWidgetState();
}

class _SplashGlobalWidgetState extends State<SplashGlobalWidget> {
  late SplashGlobalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SplashGlobalModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (loggedIn) {
        if (MediaQuery.sizeOf(context).width > 800.0) {
          if (valueOrDefault(currentUserDocument?.category, '') == 'Заказчик') {
            await Future.delayed(const Duration(milliseconds: 300));

            context.goNamed(MyOrdersWebZWidget.routeName);
          } else {
            await Future.delayed(const Duration(milliseconds: 300));

            context.goNamed(OrdersWebIWidget.routeName);
          }
        } else {
          context.goNamed(HomePageWidget.routeName);
        }
      } else {
        if (MediaQuery.sizeOf(context).width > 800.0) {
          context.goNamed(LoginWebWidget.routeName);
        } else {
          context.goNamed(LoginSmsWidget.routeName);
        }
      }
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
    return GestureDetector(
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
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  context.pushNamed(SplashGlobalWidget.routeName);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'assets/images/T_App_logo_09.png',
                    width: 270.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
