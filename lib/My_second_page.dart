import 'package:flutter/material.dart';
import 'package:xdevgr3/gloable.dart';
class MySecondPage extends StatefulWidget {

  MySecondPage({super.key});

  @override
  State<MySecondPage> createState() => _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Container(
            color: Colors.purple,
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              children: [
                CircleAvatar(
                  radius:60,
                  backgroundImage: NetworkImage(userConnected.avatar!)
                ),

                Text(userConnected.pseudo),

                Text(userConnected.email)

              ],
            )),
        appBar: AppBar(
          title: Text("nouveelle page")
        ),
        body: Text("Je suis dans la nouvelle page")
    );;
  }
}
