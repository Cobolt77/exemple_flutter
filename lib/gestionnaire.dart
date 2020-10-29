import 'package:flutter/material.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
import 'package:lexpress/pages/actualites.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

/// Gestionnaire des variables globales disponibles
/// sur toutes les écrans de l'application
class Gestionnaire {
  static double degagementMenu = 64;

  static State pageArticles;
  static ActualitesState accueil;

  static FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  static List<wp.Post> nouvelles = new List<wp.Post>();
  static List<wp.Post> emplois = new List<wp.Post>();

  static wp.WordPress wordPress = wp.WordPress(
    baseUrl: 'https://www.journalexpress.ca/',
  );

}
