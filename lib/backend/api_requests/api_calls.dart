import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Astral Group Code

class AstralGroup {
  static String getBaseUrl() => 'https://api.doc.astral.ru/api/v1';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJmZGE4MmY5ZS00ZDNkLTQ4ODctYjcyMy04ZTE0YTIwMzgzMjkiLCJpYXQiOjE3MTc0NDM2NTAsIm5iZiI6MTcxNzM3MjgwMCwiZXhwIjoxNzQ4OTA4ODAwLCJyb2xlIjoiVXNlciIsInVzZXJJZCI6IjllZThjYjI4LTQ2M2EtNDUwNS1iOGJiLWE5MzExZWJhZGM4YyIsInR5cGUiOiJTdG9yZWQiLCJpc3MiOiJlZG8uYXN0cmFsLnJ1IiwiYXVkIjoicmVzdC5hcGkuZWRvIn0.IQag38_u81fAI_tJ6dXDwVmUnKviGAq_rGc7Wh8rQgM',
  };
  static AbonentsCall abonentsCall = AbonentsCall();
}

class AbonentsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = AstralGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Abonents',
      apiUrl: '${baseUrl}/abonents',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJqdGkiOiJmZGE4MmY5ZS00ZDNkLTQ4ODctYjcyMy04ZTE0YTIwMzgzMjkiLCJpYXQiOjE3MTc0NDM2NTAsIm5iZiI6MTcxNzM3MjgwMCwiZXhwIjoxNzQ4OTA4ODAwLCJyb2xlIjoiVXNlciIsInVzZXJJZCI6IjllZThjYjI4LTQ2M2EtNDUwNS1iOGJiLWE5MzExZWJhZGM4YyIsInR5cGUiOiJTdG9yZWQiLCJpc3MiOiJlZG8uYXN0cmFsLnJ1IiwiYXVkIjoicmVzdC5hcGkuZWRvIn0.IQag38_u81fAI_tJ6dXDwVmUnKviGAq_rGc7Wh8rQgM',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Astral Group Code

class TelegramNotificationCall {
  static Future<ApiCallResponse> call({
    String? text = 'тест',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Telegram Notification',
      apiUrl:
          'https://api.telegram.org/bot6851730628:AAH4NXKCG46WHu33NBM4a2fEPDYJkVoHo28/sendMessage',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      params: {
        'chat_id': "-1002145452773",
        'text': text,
        'parse_mode': "HTML",
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SMSAeroCall {
  static Future<ApiCallResponse> call({
    String? number = '',
    String? text = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'SMS Aero',
      apiUrl: 'https://gate.smsaero.ru/v2/sms/send',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic ZGVuaXNzX3Z1a0BtYWlsLnJ1OlU1RGtsZGRxejRQbHBWcUYzd08yQjRTRnc3Z2FnS282',
      },
      params: {
        'number': number,
        'text': text,
        'sign': "SMS Aero",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendSMSMakeCall {
  static Future<ApiCallResponse> call({
    String? text = '',
    String? number = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'SendSMSMake',
      apiUrl: 'https://hook.eu2.make.com/47hzkt4g2eefyv9pupam8712g3ikul2m',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'number': number,
        'text': text,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
