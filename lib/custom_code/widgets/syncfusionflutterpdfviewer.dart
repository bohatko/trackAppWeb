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

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Syncfusionflutterpdfviewer extends StatefulWidget {
  const Syncfusionflutterpdfviewer({
    super.key,
    this.width,
    this.height,
    required this.linkPdf,
  });

  final double? width;
  final double? height;
  final String linkPdf;

  @override
  State<Syncfusionflutterpdfviewer> createState() =>
      _SyncfusionflutterpdfviewerState();
}

class _SyncfusionflutterpdfviewerState
    extends State<Syncfusionflutterpdfviewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SfPdfViewer.asset(widget.linkPdf));
  }
}
