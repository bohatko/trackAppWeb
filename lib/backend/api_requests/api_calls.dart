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

class SmsAuthCall {
  static Future<ApiCallResponse> call({
    String? to = '',
    String? msg = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'smsAuth',
      apiUrl: 'https://sms.ru/sms/send',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'api_id': "4E000A43-EEE4-D0E8-1D06-8CC93B009B71",
        'to': to,
        'msg': msg,
        'json': "1",
        'ttl': "1",
        'test': "1",
        'from': "Track App",
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

class TelegramNotificationCall {
  static Future<ApiCallResponse> call({
    String? text = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Telegram Notification',
      apiUrl:
          'https://api.telegram.org/bot6851730628:AAFn9XEQue-BAO38TVH2y6MkG873nSlfgGU/sendMessage',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'chat_id': "-1002145452773",
        'text': text,
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
