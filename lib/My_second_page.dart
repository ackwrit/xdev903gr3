import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xdevgr3/data_maps.dart';
import 'package:xdevgr3/firebase/firebase_helper.dart';
import 'package:xdevgr3/gloable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xdevgr3/map_view.dart';
import 'package:xdevgr3/model/my_user.dart';
class MySecondPage extends StatefulWidget {

  MySecondPage({super.key});

  @override
  State<MySecondPage> createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  //variable
  String? nameImage;
  Uint8List? bytesImage;

  //boite de dialogue
  showContainerInfo(){
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Souhaitez utiliser cette image"),
            content: Image.memory(bytesImage!),
            actions: [
              TextButton(
                  onPressed: (){
                    //enregistrer dans la base de donnée
                    FirebaseHelper().uploadPicture(dossier: "PROFIL", nomImage: nameImage!, bytesImage: bytesImage!, uidUser: userConnected.uid).then((value) {
                      setState(() {
                        userConnected.avatar = value;
                        Map<String,dynamic> data = {
                          "AVATAR":userConnected.avatar
                        };
                        FirebaseHelper().updateUser(userConnected.uid, data);
                        Navigator.pop(context);
                      });

                    });
                  },
                  child: Text("Validation")
              ),
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Annulation")
              )
            ],

          );
        }
    );

  }

  //récupérer l'image
  pickImage() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      withData: true,
      type: FileType.image
    );
    if(result !=null){
      nameImage = result.files.first.name;
      bytesImage = result.files.first.bytes;
      //boite de dialogue
      showContainerInfo();
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Container(
            color: Colors.purple,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              children: [
                GestureDetector(
                  onTap: (){
                    pickImage();

                  },
                  child: CircleAvatar(
                    radius:60,
                    backgroundImage: NetworkImage(userConnected.avatar!)
                  ),
                ),

                Text(userConnected.pseudo),

                Text(userConnected.email)

              ],
            )),
        appBar: AppBar(
          title: Text("nouveelle page")
        ),
        body: DataMaps(),
    );;
  }
}
