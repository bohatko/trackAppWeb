// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

import 'package:dio/dio.dart';

Future<bool> sendSmsAero(
  String? number,
  String? text,
) async {
  if (number == null || number.isEmpty || text == null || text.isEmpty) {
    return false;
  }

  // Ensure the number is properly formatted
  if (!number.startsWith('+')) {
    number = '+$number';
  }

  try {
    const String email = 'deniss_vuk@mail.ru';
    const String apiKey = 'U5DklddqZ4PlpVqF3wO2B4SFw7gagKo6';

    Dio dio = Dio();
    // Basic auth
    dio.options.headers['authorization'] =
        'Basic ${base64Encode(utf8.encode('$email:$apiKey'))}';

    final response = await dio.get(
      'https://gate.smsaero.ru/v2/sms/send',
      queryParameters: {
        'number': number,
        'text': text,
        'sign': 'SMS Aero',
      },
    );

    print('Response: ${response.data}');
    return response.data['success'] == true;
  } catch (e) {
    print('Error sending SMS: $e');
    return false;
  }
}
