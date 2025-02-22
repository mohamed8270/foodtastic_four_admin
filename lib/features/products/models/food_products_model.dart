class FoodProductsModel {
  final String id;
  final String token;
  final String foodName;
  final String description;
  final String calories;
  final String foodType;
  final int preparedWithIn;
  final int price;
  final int offer;
  final int counter;
  final bool mealOfDay;

  FoodProductsModel({required this.id, required this.token, required this.foodName, required this.description, required this.calories, required this.foodType, required this.preparedWithIn, required this.price, required this.offer, required this.counter, required this.mealOfDay});

  factory FoodProductsModel.fromJson(Map<String, dynamic> json) => FoodProductsModel(
    id: json['_id'],
        token: json['token'],
        foodName: json['foodName'],
        description: json['description'],
        calories: json['calories'],
        foodType: json['foodType'],
        preparedWithIn: json['preparedWithIn'],
        price: json['price'],
        offer: json['offer'],
        counter: json['counter'],
        mealOfDay: json['mealOfDay']);
}