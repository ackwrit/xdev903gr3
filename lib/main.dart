import 'package:flutter/material.dart';
import 'package:xdevgr3/My_second_page.dart';
import 'package:xdevgr3/firebase/firebase_helper.dart';
import 'package:xdevgr3/gloable.dart';
import 'package:xdevgr3/mon_animation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:xdevgr3/permission_photo.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  PermissionPhoto().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //variable
  TextEditingController mail = TextEditingController();
  TextEditingController pseudo = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool visible = true;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:SingleChildScrollView(
          child: Column(children: [

        MyAnimation(
          duree: 6,
          child: Container(
            height:200,
            width: 400,

            decoration: BoxDecoration(

                  borderRadius:BorderRadius.circular(20),
              image:const DecorationImage(
                image:NetworkImage("https://media.gqmagazine.fr/photos/606c19c3a813725515a80944/16:9/w_1920,c_limit/mclarenarturaflux-11.jpeg"),
              )
            )
          ),
        ),
            /*pseudo*/
            MyAnimation(
              duree: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: pseudo,
                    decoration: InputDecoration(hintText: "Entrer le pseudo",
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)

                        )),
                ),
              ),
            ),


            /*adresse mail*/
            MyAnimation(
              duree: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: mail,
                    decoration: InputDecoration(
                      hintText: "Entrer l'adresse mail",
                      prefixIcon: const Icon(Icons.mail),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))



                    )
                ),
              ),
            ),

            /*mot de passe */
            MyAnimation(
              duree: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: pass,
                    obscureText: visible,
                    decoration: InputDecoration(hintText: "Entrer le mot de passe",
                      prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          onPressed: (){
                            setState(() {
                              visible = !visible;
                            });


                          },
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                    )),
              ),
            ),

            /*boutton de connexion*/
            MyAnimation(
              duree: 4,
              child: ElevatedButton(
                  child: const Text("Connexion"),
                  onPressed: () {
                   FirebaseHelper().connexion(mail.text, pass.text).then((value) {
                     setState(() {
                       userConnected = value;
                     });
                     Navigator.push(
                         context,
                         MaterialPageRoute(
                             builder: (context) => MySecondPage()));
                   }).catchError((onError){
                     print("mot de passe erroné");
                   });


                  }),
            ),

            /*inscription */
            MyAnimation(
              duree: 5,
              child: TextButton(
                  child: const Text("Inscription"),
                  onPressed: () {
                    FirebaseHelper().inscription(pseudo.text, mail.text, pass.text).then((value) {
                      setState(() {
                        userConnected = value;

                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)=>MySecondPage()));
                      });
                    });
                  }),
            ),
          ]))

    );
  }
}
