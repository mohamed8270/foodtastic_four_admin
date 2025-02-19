abstract class DumbFoodState {}

class DumbFoodInitial extends DumbFoodState {}

class DumbFoodLoading extends DumbFoodState {
  final bool isLoading;
  final String isResponse;

  DumbFoodLoading({this.isLoading = true, this.isResponse = 'Just a moment..'});
}

class DumbFoodLoaded extends DumbFoodState {
  final String success;
  final bool isLoaded;

  DumbFoodLoaded({required this.success, this.isLoaded = true});
}

class DumbFoodError extends DumbFoodState {
  final String error;
  final bool isError;

  DumbFoodError({required this.error, this.isError = true});
}