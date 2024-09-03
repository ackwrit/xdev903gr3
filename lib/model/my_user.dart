
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xdevgr3/gloable.dart';

class MyUser {
  late String uid;
  String? avatar;
  late String pseudo;
  late String email;
  late bool connected;







  MyUser(){
    uid="";
    avatar=null;
    pseudo="";
    email = "";
    connected = false;
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
  }
}