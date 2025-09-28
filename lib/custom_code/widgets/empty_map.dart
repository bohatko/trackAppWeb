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

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as ll;

class EmptyMap extends StatefulWidget {
  const EmptyMap({
    super.key,
    this.width,
    this.height,
    this.orderGeo,
    this.driverGeo,
    required this.zoom,
  });

  final double? width;
  final double? height;
  final LatLng? orderGeo;
  final LatLng? driverGeo;
  final double? zoom;

  @override
  State<EmptyMap> createState() => _EmptyMapState();
}

class _EmptyMapState extends State<EmptyMap> {
  ll.LatLng convertLatLngToLatLong(LatLng? latLng) {
    if (latLng == null)
      return ll.LatLng(0.0, 0.0); // Проверка на null и преобразование
    return ll.LatLng(latLng.latitude, latLng.longitude);
  }

  @override
  Widget build(BuildContext context) {
    final orderGeoConverted = convertLatLngToLatLong(widget.orderGeo);
    final driverGeoConverted = convertLatLngToLatLong(widget.driverGeo);

    List<CircleMarker> circles = [
      CircleMarker(
        point: orderGeoConverted,
        radius: 100,
        useRadiusInMeter: true,
        color: Color.fromARGB(255, 238, 159, 22).withOpacity(0.7),
        borderColor: Color.fromARGB(255, 164, 114, 4),
        borderStrokeWidth: 2,
      ),
    ];

    List<Marker> markers = [];
    if (widget.driverGeo != LatLng(55, 37)) {
      markers.add(
        Marker(
          point: driverGeoConverted,
          width: 80,
          height: 80,
          child: Image.network(
              "https://firebasestorage.googleapis.com/v0/b/track-app-uxjczg.appspot.com/o/10549281%20(2).png?alt=media&token=2c5734dc-9b41-4560-8e51-edc084f419ea"),
        ),
      );
    }

    List<Polyline> polylines = [];
    // Добавляем PolylineLayer только если driverGeo не равно (0.0, 0.0)
    if (widget.driverGeo != LatLng(55, 37)) {
      polylines.add(
        Polyline(
          points: [driverGeoConverted, orderGeoConverted],
          strokeWidth: 12.0,
          color: Color.fromARGB(255, 7, 7, 7).withOpacity(0.7),
          //isDotted: true,
        ),
      );
    }

    return FlutterMap(
      options: MapOptions(
        initialCenter: orderGeoConverted,
        initialZoom: widget.zoom!,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.mobiapp.trackApp',
        ),
        CircleLayer(circles: circles),
        MarkerLayer(markers: markers),
        PolylineLayer(polylines: polylines),
      ],
    );
  }
}
