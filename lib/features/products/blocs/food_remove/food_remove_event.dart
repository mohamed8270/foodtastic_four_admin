abstract class FoodRemoveEvent {}

class FoodRemove extends FoodRemoveEvent {
  final String foodId;

  FoodRemove({required this.foodId});
}