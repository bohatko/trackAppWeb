// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

class DownloadAndViewDocument extends StatefulWidget {
  const DownloadAndViewDocument({
    super.key,
    this.width,
    this.height,
    required this.link, // Добавляем новый параметр
  });

  final double? width;
  final double? height;
  final String link; // Декларируем новый параметр

  @override
  _DownloadAndViewDocumentState createState() =>
      _DownloadAndViewDocumentState();
}

class _DownloadAndViewDocumentState extends State<DownloadAndViewDocument> {
  String _documentPath = '';

  Future<void> downloadAndOpenDocument(String url, String fileName) async {
    try {
      final status = await Permission.storage.request();
      if (status.isGranted) {
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/$fileName';
        await Dio().download(url, filePath);
        setState(() {
          _documentPath = filePath;
        });
        OpenFile.open(filePath); // Здесь тоже может потребоваться адаптация
      } else {
        print('Permission Denied');
      }
    } catch (e) {
      print('Error downloading or opening file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Download and Open Document'),
          onPressed: () => downloadAndOpenDocument(
              widget.link, // Используем параметр link
              'example-document.pdf'),
        ),
      ),
    );
  }
}
