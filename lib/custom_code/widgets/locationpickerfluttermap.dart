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

// Import the location picker package
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';
import 'package:location_picker_flutter_map/src/classes.dart' as src2;

void pickLocation(BuildContext context) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const Locationpickerfluttermap(),
    ),
  );

  if (result != null) {
    // Обновление глобального состояния или выполнение действия с возвращенным адре
    print("Picked address: $result");
    // Пример обновления глобального состояния
    FFAppState().pickedDataaddress = result;
  }
}

class Locationpickerfluttermap extends StatefulWidget {
  const Locationpickerfluttermap({
    super.key,
    this.width,
    this.height,
    this.myposition,
  });

  final double? width;
  final double? height;
  final LatLng? myposition;

  @override
  State<Locationpickerfluttermap> createState() =>
      _LocationpickerfluttermapState();
}

class _LocationpickerfluttermapState extends State<Locationpickerfluttermap> {
  // Convert LatLng to LatLong

  LatLong? convertLatLngToLatLong(LatLng? latLng) {
    if (latLng == null) return null;
    return LatLong(latLng.latitude, latLng.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLocationPicker(
        initZoom: 11,
        minZoomLevel: 2,
        maxZoomLevel: 16,
        trackMyPosition: true,
        searchBarBackgroundColor: Colors.white,
        mapLanguage: 'ru',
        selectLocationButtonLeadingIcon: const Icon(Icons.check),
        selectLocationButtonText: "Установить местоположение",
        searchBarHintText: "Поиск места",
        initPosition: src2.LatLong(55.7558, 37.6173),
        onPicked: (pickedData) {
          FFAppState().pickedDataaddress = pickedData.address;
          FFAppState().pickedDataaddressLatLong = LatLng(
            pickedData.latLong.latitude,
            pickedData.latLong.longitude,
          );

          Navigator.pop(context);
        },
        onChanged: (pickedData) {},
      ),
    );
  }
}
