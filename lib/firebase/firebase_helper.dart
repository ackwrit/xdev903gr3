

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:xdevgr3/model/my_user.dart';

class FirebaseHelper{
 final auth =  FirebaseAuth.instance;
 final mesUtilisateurs = FirebaseFirestore.instance.collection("UTILISATEURS");
 final mesStorages = FirebaseStorage.instance;



 //s'inscrire
 Future <MyUser>inscription(String pseudo, String email , String password) async {
   UserCredential credential = await auth.createUserWithEmailAndPassword(email: email, password: password);
   String uid = credential.user!.uid;
   Map<String,dynamic> data ={
     "EMAIL":email,
     "PSEUDO":pseudo
   };
   addUser(uid, data);
   return getUser(uid);

 }




//connecter
 Future <MyUser>connexion(String email , String password) async{
   UserCredential credential = await auth.signInWithEmailAndPassword(email: email, password: password);
   String uid = credential.user!.uid;
   return getUser(uid);

 }


 // récuperer les infos de l'utilisateur
  Future <MyUser> getUser(String uid) async {
   DocumentSnapshot snapshot = await mesUtilisateurs.doc(uid).get();
   return MyUser.bdd(snapshot);

  }



//ajouter un utlisateur
addUser(String uid,Map<String,dynamic> data){
   mesUtilisateurs.doc(uid).set(data);
}


//mise à jour utilisateur
  updateUser(String uid,Map<String,dynamic> data){
    mesUtilisateurs.doc(uid).update(data);
  }



//supprimer un utilisateur
deleteUser(String uid){
   mesUtilisateurs.doc(uid).delete();
   auth.currentUser!.delete();

}




//uploader des images








}