class FoodOrderModel {
  final String id;
  final String userId;
  final String userName;
  final String email;
  final int quantity;
  final int counter;
  final String foodId;
  final String foodName;
  final String foodType;
  final int foodPrice;
  final String orderToken;

  FoodOrderModel({required this.id, required this.userId, required this.userName, required this.email, required this.quantity, required this.counter, required this.foodId, required this.foodName, required this.foodType, required this.foodPrice, required this.orderToken});

  factory FoodOrderModel.fromJson(Map<String, dynamic> json) => FoodOrderModel(
      id: json['_id'],
      userId: json['userId'],
        userName: json['userName'],
        email: json['email'],
        quantity: json['quantity'],
        counter: json['counter'],
        foodId: json['foodId'],
        foodName: json['foodName'],
        foodType: json['foodType'],
        foodPrice: json['foodPrice'],
        orderToken: json['orderToken']);
}