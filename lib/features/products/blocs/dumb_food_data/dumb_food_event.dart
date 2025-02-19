abstract class DumbFoodEvent {}

class DumbFoodData extends DumbFoodEvent {
  final String foodName;
  final String description;
  final String calories;
  final String foodType;
  final int preparedWithIn;
  final double price;
  final int offer;
  final int counter;
  final bool mealOfDay;

  DumbFoodData({required this.foodName, required this.description, required this.calories, required this.foodType, required this.preparedWithIn, required this.price, required this.offer, required this.counter, required this.mealOfDay});
}