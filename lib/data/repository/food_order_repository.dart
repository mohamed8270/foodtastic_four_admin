import 'package:foodtastic_four_admin/data/services/api_service.dart';
import 'package:foodtastic_four_admin/features/products/models/food_order_model.dart';

class FoodOrderRepository {
  final ApiService apiService;

  FoodOrderRepository(this.apiService);

  // get food orders
  Future<List<FoodOrderModel>> getFoodOrders(Map<String, dynamic> body) async {
    return await apiService.getOrderedFood(body);
  }

  // deliver ordered foods
  Future<String?> deliverFoodOrders(Map<String, dynamic> body) async {
    final res = await apiService.deliveredFoodData(body);
    return res['status'].toString();
  }
}