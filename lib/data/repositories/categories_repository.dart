import '../models/category_model.dart';
import '../web_services/categories_web_services.dart';

class CategoriesRepository {
  final CategoriesWebServices categoriesWebServices;
  List<CategoryModel> categories = [];
  CategoriesRepository({
    required this.categoriesWebServices,
  });

  Future<List<CategoryModel>> getCategories() async {
    final data = await categoriesWebServices.getCategories();
categories=[];
    for (var category in data['data']) {
      categories.add(CategoryModel.fromMap(category));
    }
    return categories;
  }
}
