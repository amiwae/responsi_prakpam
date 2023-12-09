import 'base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadCategories() {
    return BaseNetwork.get("categories.php");
  }

  Future<Map<String, dynamic>> loadMeals(String strCategory) {
    return BaseNetwork.get("filter.php?c=$strCategory");
  }

  Future<Map<String, dynamic>> loadDetailMeals(String id) {
    return BaseNetwork.get("lookup.php?i=$id");
  }
}
