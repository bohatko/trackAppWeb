import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? isWeb
          ? Container()
          : Container(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              child: Image.asset(
                'assets/images/T_App_logo_09.png',
                fit: BoxFit.contain,
              ),
            )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'onbording': ParameterData.none(),
  'login_sms': (data) async => ParameterData(
        allParams: {
          'number': getParameter<String>(data, 'number'),
          'driverName': getParameter<String>(data, 'driverName'),
          'driverLastName': getParameter<String>(data, 'driverLastName'),
          'companyRef': getParameter<DocumentReference>(data, 'companyRef'),
          'assignUser': getParameter<DocumentReference>(data, 'assignUser'),
        },
      ),
  'sms_confirm': (data) async => ParameterData(
        allParams: {
          'number': getParameter<String>(data, 'number'),
        },
      ),
  'Add_new_order': ParameterData.none(),
  'Notification_page': ParameterData.none(),
  'Tehnik_more': (data) async => ParameterData(
        allParams: {
          'tehnikDoc': await getDocumentParameter<TehnikaRecord>(
              data, 'tehnikDoc', TehnikaRecord.fromSnapshot),
          'tehModeDoc': await getDocumentParameter<SpravochnikTekhnikaRecord>(
              data, 'tehModeDoc', SpravochnikTekhnikaRecord.fromSnapshot),
          'oborudDoc': await getDocumentParameter<DopOborudRecord>(
              data, 'oborudDoc', DopOborudRecord.fromSnapshot),
        },
      ),
  'Contact_page': ParameterData.none(),
  'Order_detail_z': (data) async => ParameterData(
        allParams: {
          'orderRef': getParameter<DocumentReference>(data, 'orderRef'),
        },
      ),
  'Add_new_technik': ParameterData.none(),
  'List_employers': ParameterData.none(),
  'Home_page': ParameterData.none(),
  'Cabinet_page': ParameterData.none(),
  'List_Technika': ParameterData.none(),
  'Employers_more': (data) async => ParameterData(
        allParams: {
          'userref': await getDocumentParameter<UsersRecord>(
              data, 'userref', UsersRecord.fromSnapshot),
        },
      ),
  'Add_offer': (data) async => ParameterData(
        allParams: {
          'orderDoc': await getDocumentParameter<OrdersRecord>(
              data, 'orderDoc', OrdersRecord.fromSnapshot),
        },
      ),
  'Faq_page': ParameterData.none(),
  'Offers_more': (data) async => ParameterData(
        allParams: {
          'orderDoc': await getDocumentParameter<OrdersRecord>(
              data, 'orderDoc', OrdersRecord.fromSnapshot),
          'oFFerDoc': getParameter<DocumentReference>(data, 'oFFerDoc'),
        },
      ),
  'Chat_page': (data) async => ParameterData(
        allParams: {
          'chatRef': getParameter<DocumentReference>(data, 'chatRef'),
        },
      ),
  'Offers_page': ParameterData.none(),
  'Projecks_page': ParameterData.none(),
  'Create_company': ParameterData.none(),
  'AddLocation': (data) async => ParameterData(
        allParams: {
          'myLocation': getParameter<LatLng>(data, 'myLocation'),
        },
      ),
  'OfertaPage': ParameterData.none(),
  'Add_new_dop_oborud': ParameterData.none(),
  'Order_detail_is': (data) async => ParameterData(
        allParams: {
          'orderRef': getParameter<DocumentReference>(data, 'orderRef'),
        },
      ),
  'SplashPage': (data) async => ParameterData(
        allParams: {
          'pincode': getParameter<String>(data, 'pincode'),
          'number': getParameter<String>(data, 'number'),
        },
      ),
  'LoginWeb': ParameterData.none(),
  'MyOrdersWeb_Z': ParameterData.none(),
  'NotificationWeb': ParameterData.none(),
  'MyTehnikAndOborudWeb': ParameterData.none(),
  'MyEmployersWeb': ParameterData.none(),
  'NewOrdersWeb': ParameterData.none(),
  'AnsversWeb': ParameterData.none(),
  'SupportWeb': ParameterData.none(),
  'SplashPage_web': (data) async => ParameterData(
        allParams: {
          'number': getParameter<String>(data, 'number'),
        },
      ),
  'SplashGlobal': ParameterData.none(),
  'MoreOrders_Z': (data) async => ParameterData(
        allParams: {
          'orderRef': getParameter<DocumentReference>(data, 'orderRef'),
        },
      ),
  'MyCabinetWeb': ParameterData.none(),
  'OrdersWeb_I': ParameterData.none(),
  'OtklikOrders_I': (data) async => ParameterData(
        allParams: {
          'orderRef': getParameter<DocumentReference>(data, 'orderRef'),
        },
      ),
  'Projects_I': ParameterData.none(),
  'OfertaWeb': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
