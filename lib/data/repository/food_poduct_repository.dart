import 'package:foodtastic_four_admin/data/services/api_service.dart';
import 'package:foodtastic_four_admin/features/products/models/food_products_model.dart';

class FoodProductRepository {
  final ApiService apiService;

  FoodProductRepository(this.apiService);

  // store food data
  Future<String?> dumbFoodData(Map<String, dynamic> body) async {
    final res = await apiService.insertFoodData(body);
    return res['status'].toString();
  }

  // get all food data
  Future<List<FoodProductsModel>> getAllFoodProducts() async {
    return await apiService.getFoodProducts();
  }

  // remove food data
  Future<String?> removeFoodData(Map<String, dynamic> body) async {
    final res = await apiService.removeFoodData(body);
    return res['status'].toString();
  }
}