import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
import 'package:lexpress/gestionnaire.dart';

/// Service permettant la communication des opérations
/// sur les catégories présentes sur la plateforme Novae
class CategoriesService {
  static Future<List<wp.Category>> obtenirCategories(List<int> categories) {
    return Gestionnaire.wordPress.fetchCategories(
        params: wp.ParamsCategoryList(includeCategoryIDs: categories));
  }
}
