import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtastic_four_admin/data/repository/food_poduct_repository.dart';
import 'package:foodtastic_four_admin/features/products/blocs/load_food_data/load_data_event.dart';
import 'package:foodtastic_four_admin/features/products/blocs/load_food_data/load_data_state.dart';
import 'package:foodtastic_four_admin/utils/http/dio_exception_handler.dart';
import 'package:foodtastic_four_admin/utils/logging/logging.dart';

class AllFoodBloc extends Bloc<AllFoodEvent, AllFoodState> {
  final FoodProductRepository foodProductRepository;

  AllFoodBloc(this.foodProductRepository) : super(FoodInitial()) {
    on<FetchFoodData>((event, emit) async {
      emit(FoodInitial());
      try {
        final foods = await foodProductRepository.getAllFoodProducts();
        AppLogger.debug([foods[0].foodName, foods[0].description, foods[0].calories, foods[0].preparedWithIn.toString(), foods[0].offer.toString(), foods[0].mealOfDay.toString(), foods[0].price.toString(), foods[0].counter.toString(), foods[0].foodType, foods[0].token].toString());
        if(foods.isEmpty) {
          emit(FoodError(e: 'There is no food items to show'));
        } else {
          emit(FoodLoaded(foods: foods));
        }
      } on DioException catch(e) {
        emit(FoodError(e: DioExceptionHandler.handleException(e)));
      }
    });
  }
}