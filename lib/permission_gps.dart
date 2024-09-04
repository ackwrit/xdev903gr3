

import 'package:geolocator/geolocator.dart';

class PermissionGps {

  Future<Position>init() async{
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      return Future.error("le gps n'est pas activé");
    }
    else
      {
        LocationPermission locationPermission = await Geolocator.checkPermission();
        return PermissionVerification(locationPermission);
      }
  }

  Future<Position>PermissionVerification(LocationPermission permission){
    switch(permission){

      case LocationPermission.deniedForever : return Future.error("Toujours refusé");
      case LocationPermission.denied : return Geolocator.requestPermission().then((value) => PermissionVerification(value));
      case LocationPermission.unableToDetermine : return Geolocator.requestPermission().then((value) => PermissionVerification(value));
      case LocationPermission.whileInUse : return Geolocator.getCurrentPosition();
      case LocationPermission.always : return Geolocator.getCurrentPosition();
    }

  }


}