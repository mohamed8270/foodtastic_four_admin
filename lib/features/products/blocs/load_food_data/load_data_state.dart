import 'package:foodtastic_four_admin/features/products/models/food_products_model.dart';

abstract class AllFoodState {}

class FoodInitial extends AllFoodState {}

class FoodLoading extends AllFoodState{}

class FoodLoaded extends AllFoodState {
  final List<FoodProductsModel> foods;

  FoodLoaded({required this.foods});
}

class FoodError extends AllFoodState {
  final String e;

  FoodError({required this.e});
}