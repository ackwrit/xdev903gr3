import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  Position coordonee;
  const MapView({super.key,required coordonee});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  //variable
  Completer<GoogleMapController> completer = Completer();
  late CameraPosition MaCamera;

  @override
  void iniState(){
    maCamera = CameraPosition(target: LatLng(widget.coordonee.lattitude,widget.coordonee.longitude),zoom : 14)
    super.iniState();
  }
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
        initialCameraPosition: maCamera,
      onMapCreated: (controller) async{
        String newStyle = await DefaultAssetBundle.of(context).loadString("lib/mapstyle.json");
        controller.setMapStyle(newStyle);
          completer.complete(controller);

      },

    );
  }
}
