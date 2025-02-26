import 'package:foodtastic_four_admin/features/products/models/food_order_model.dart';

abstract class LoadOrderState {}

class LoadOrderInitial extends LoadOrderState {}

class LoadOrderLoading extends LoadOrderState {}

class LoadOrderLoaded extends LoadOrderState {
  final List<FoodOrderModel> foodOrders;

  LoadOrderLoaded({required this.foodOrders});
}

class LoadOrderError extends LoadOrderState {
  final String e;

  LoadOrderError({required this.e});
}