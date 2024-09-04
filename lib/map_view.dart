import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:xdevgr3/firebase/firebase_helper.dart';
import 'package:xdevgr3/gloable.dart';
import 'package:xdevgr3/model/my_user.dart';

class MapView extends StatefulWidget {
  Position coordonee;
  MapView({super.key,required this.coordonee});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  //variable
  Completer<GoogleMapController> completer = Completer();
  late CameraPosition maCamera;
  Set<Marker>allMarkers = Set();


  @override
  void iniSttate(){
    maCamera = CameraPosition(target: LatLng(widget.coordonee.latitude,widget.coordonee.longitude),zoom : 14);
    FirebaseHelper().mesUtilisateurs.snapshots().listen((event){
      setState((){
       List documents = event.docs;
       for(int i=0;i<documents.length;i++){
         MyUser lesAutres = MyUser.bdd(documents[i]);
         if(userConnected.uid != lesAutres.uid){
           Marker marker = Marker(
               markerId: MarkerId(lesAutres.uid),
             position: LatLng(lesAutres.coordonnee!.latitude, lesAutres.coordonnee!.longitude),
             infoWindow: InfoWindow(
               title: lesAutres.pseudo
             )
           );
           allMarkers.add(marker);
         }

       }
    });


    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: allMarkers,
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
