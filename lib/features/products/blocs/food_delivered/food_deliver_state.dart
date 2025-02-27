abstract class FoodDeliverState {}

class FoodDeliverInitial extends FoodDeliverState {}

class FoodDeliverLoading extends FoodDeliverState {}

class FoodDeliverLoaded extends FoodDeliverState {
  final String status;

  FoodDeliverLoaded({required this.status});
}

class FoodDeliverError extends FoodDeliverState {
  final String error;

  FoodDeliverError({required this.error});
}