abstract class FoodDeliverEvent {}

class FoodDeliver extends FoodDeliverEvent {
  final String foodId;

  FoodDeliver({required this.foodId});
}