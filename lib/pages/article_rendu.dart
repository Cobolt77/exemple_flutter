import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;

/// Page d'accueil de l'application
class ArticleRendu extends StatefulWidget {
  ArticleRendu({Key key}) : super(key: key);

  @override
  ArticleRenduState createState() => ArticleRenduState();
}

class ArticleRenduState extends State<ArticleRendu> {
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
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    final wp.Post post = ModalRoute.of(context).settings.arguments;

    // print(Gestionnaire.nouvelles[2].categories.toString());
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            Html(
              data: post.content.rendered,
            )
          ],
        ));
  }
}
