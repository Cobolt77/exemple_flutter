import 'dart:convert';

import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
import 'package:lexpress/gestionnaire.dart';
import 'package:http/http.dart' as http;

/// Service permettant la communication des opérations
/// sur les nouvelles présentes sur la plateforme Novae
class NouvellesService {
  static Future<List<wp.Post>> obtenirNouvelles() {
    print("Obtention des nouvelles");
    return Gestionnaire.wordPress
        .fetchPosts(
      postParams: wp.ParamsPostList(
        context: wp.WordPressContext.view,
        pageNum: 1,
        perPage: 10,
        order: wp.Order.desc,
        orderBy: wp.PostOrderBy.date,
      ),
      // fetchFeaturedMedia: true,
      fetchCategories: true,
    );
  }
}
