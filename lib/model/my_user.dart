
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:xdevgr3/gloable.dart';

class MyUser {
  late String uid;
  String? avatar;
  late String pseudo;
  late String email;
  late bool connected;
  Position? coordonnee;








  MyUser(){
    uid="";
    avatar=null;
    pseudo="";
    email = "";
    connected = false;
    coordonnee=null;
  }


  MyUser.bdd(DocumentSnapshot documentSnapshot){
      uid = documentSnapshot.id;
      Map<String,dynamic> map = documentSnapshot.data() as Map<String,dynamic>;
      connected = true;
      email = map["EMAIL"];
      pseudo = map["PSEUDO"];
      String? provisoire = map["AVATAR"];
      if(provisoire == null){
        avatar = imageDefault;
      }
      else
        {
          avatar = provisoire;
        }
      GeoPoint? point = map["GPS"];
      if(point == null){
        coordonnee = null;
      }
      else
        {
          coordonnee = Position(longitude: point!.longitude, latitude: point!.latitude, timestamp: DateTime.now(), accuracy: 0, altitude: 0, altitudeAccuracy: 0, heading: 0, headingAccuracy: 0, speed: 0, speedAccuracy: 0);
        }
  }
}