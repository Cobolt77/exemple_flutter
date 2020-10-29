import 'package:flutter/material.dart';
import 'package:lexpress/gestionnaire.dart';
import 'package:flushbar/flushbar.dart';
import 'package:lexpress/services/nouvelles.service.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
import 'package:webview_flutter/webview_flutter.dart';

/// Page d'accueil de l'application
class Actualites extends StatefulWidget {
  Actualites({Key key}) : super(key: key);

  @override
  ActualitesState createState() => ActualitesState();
}

class ActualitesState extends State<Actualites> {
  // Variable de grandeur d'écran
  double screenHeight;
  double screenWidth;

  void montrerNotification(Map<String, dynamic> message) {
    Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      message: message["notification"]["title"].toString(),
      // message: message["notification"]["body"].toString(),
      icon: Icon(
        Icons.notifications,
        size: 28.0,
        color: Colors.redAccent,
      ),
      duration: Duration(seconds: 3),
      leftBarIndicatorColor: Colors.redAccent,
    )..show(context);
  }

  @override
  void initState() {
    super.initState();
    Gestionnaire.accueil = this;
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    // print(Gestionnaire.nouvelles[2].categories.toString());
    return Scaffold(
        body: ListView(
      children: [
        Text("Actualités",
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
        FutureBuilder(
          future: NouvellesService.obtenirNouvelles(),
          initialData: [],
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var nouvelles = new List<Widget>();

              for (wp.Post nouvelle in snapshot.data) {
                nouvelles.add(GestureDetector(
                  onLongPress: () {
                    Flushbar(
                      flushbarPosition: FlushbarPosition.TOP,
                      flushbarStyle: FlushbarStyle.FLOATING,
                      message: "Ajouté aux favoris!",
                      // message: message["notification"]["body"].toString(),
                      icon: Icon(
                        Icons.notifications,
                        size: 28.0,
                        color: Colors.greenAccent,
                      ),
                      duration: Duration(seconds: 3),
                      leftBarIndicatorColor: Colors.redAccent,
                    )..show(context);
                  },
                  onDoubleTap: () => {
                    Navigator.pushNamed(context, "/article_rendu",
                        arguments: nouvelle)
                  },
                  onTap: () => {
                    Navigator.pushNamed(context, "/article",
                        arguments: nouvelle.link)
                  },
                  child: Container(
                    color: Colors.black,
                    padding: EdgeInsets.all(5),
                    width: screenWidth,
                    height: 50,
                    margin: EdgeInsets.only(top: 15),
                    child: Text(
                      nouvelle.title.rendered,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ));
              }

              return Column(
                children: nouvelles,
              );
            } else {
              return Container(
                child: Text(
                  "Chargement",
                  style: TextStyle(color: Colors.black),
                ),
              );
            }
          },
        )
      ],
    ));
  }
}
