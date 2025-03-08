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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csv/csv.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';

Future generateAndDownloadCsv(
  String firestoreCollectionName,
  List<String> csvHeaderTitles,
  List<String> firestoreFieldNames,
) async {
  final CollectionReference myCollection =
      FirebaseFirestore.instance.collection(firestoreCollectionName);
  final QuerySnapshot querySnapshot = await myCollection.get();
  final List<QueryDocumentSnapshot> documents = querySnapshot.docs;

  final List<List<dynamic>> rows = [];
  rows.add(csvHeaderTitles);
  for (final document in documents) {
    List<dynamic> values = [];
    final data = document.data() as Map<String, dynamic>;
    for (var field in firestoreFieldNames) {
      values.add(data[field]);
    }
    rows.add(values);
  }

  final csvData = const ListToCsvConverter().convert(rows);
  final bytes = utf8.encode(csvData);
  final base64Data = base64Encode(bytes);
  final DateTime now = DateTime.now();
  final String formattedDate =
      "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} at ${now.hour.toString().padLeft(2, '0')}.${now.minute.toString().padLeft(2, '0')}.${now.second.toString().padLeft(2, '0')}";
  final String fileName = '$firestoreCollectionName $formattedDate';
  final uri = 'data:text/csv;charset=utf-8;base64,$base64Data';
  await launch(uri, headers: <String, String>{'download': fileName});
}
