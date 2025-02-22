abstract class FoodRemoveState {}

class FoodRemoveInitial extends FoodRemoveState {}

class FoodRemoveLoading extends FoodRemoveState {}

class FoodRemoveLoaded extends FoodRemoveState {
  final String message;

  FoodRemoveLoaded({required this.message});
}

class FoodRemoveError extends FoodRemoveState {
  final String e;

  FoodRemoveError({required this.e});
}