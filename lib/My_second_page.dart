import 'package:flutter/material.dart';
class MySecondPage extends StatefulWidget {
  TextEditingController? email;
  TextEditingController nickname;
  MySecondPage({super.key, this.email, required this.nickname});

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
                  backgroundImage: NetworkImage("https://cdn.automobile-propre.com/uploads/2022/03/foxtron-model-e.jpg")
                ),
                Text(widget.nickname.text),
                Text(widget.email!.text),
              ],
            )),
        appBar: AppBar(
          title: Text(widget.email!.text),
        ),
        body: Text("Je suis dans la nouvelle page")
    );;
  }
}
