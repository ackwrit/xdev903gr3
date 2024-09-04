import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  //variable
  Completer<GoogleMapController> completer = Completer();
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        initialCameraPosition: CameraPosition(target: LatLng(	35.689487, 139.691706),zoom: 15),
      onMapCreated: (controller){
          completer.complete(controller);

      },
    );
  }
}
