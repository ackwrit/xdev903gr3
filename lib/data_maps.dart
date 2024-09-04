import "package:flutter/material.dart";




class DataMaps extends StatefulWidget {
  const DataMaps({super.key});

  @override
  State<DataMaps> createState() => _DataMapsState();
}

class _DataMapsState extends State<DataMaps> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Position>(
      future:PermissionGps().init(),
      builder: (context,resultat){
        if(resultat.connectionState == ConnectionState.waiting){
           return Center(
             child: CircularProgessIndicator.adaptive()
           );

        }
        else {
          if(resultat.data = null){
            return Center(
              child : Text("Vous ne pouvez pas afficher la carte")
            );
          }
          else {
            Position coordonnee = resultat.data!;
            return MapView(coordonee : coordonnee);
          }

        }

    }
    ) ;
  }
}
