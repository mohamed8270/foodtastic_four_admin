import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtastic_four_admin/data/repository/food_poduct_repository.dart';
import 'package:foodtastic_four_admin/features/products/blocs/dumb_food_data/dumb_food_event.dart';
import 'package:foodtastic_four_admin/features/products/blocs/dumb_food_data/dumb_food_state.dart';
import 'package:foodtastic_four_admin/utils/http/dio_exception_handler.dart';
import 'package:foodtastic_four_admin/utils/local_storage/local_storage.dart';
import 'package:foodtastic_four_admin/utils/logging/logging.dart';

class DumbFoodBloc extends Bloc<DumbFoodEvent, DumbFoodState> {
  final FoodProductRepository foodProductRepository;

  DumbFoodBloc(this.foodProductRepository): super(DumbFoodInitial()) {
    on<DumbFoodData>((event, emit) async {
      emit(DumbFoodLoading());
      try {
        String? token = await LocalStorage.token();
        if(token != null) {
          Map<String, dynamic> body = {'token': token, 'foodName': event.foodName, 'description': event.description, 'calories': event.calories, 'foodType': event.foodType, 'preparedWithIn': event.preparedWithIn, 'price': event.price, 'offer': event.offer, 'counter': event.counter, 'mealOfDay': event.mealOfDay};
          AppLogger.info(body.toString());
          final res = await foodProductRepository.dumbFoodData(body);
          emit(DumbFoodLoaded(success: res.toString()));
          await Future.delayed(const Duration(seconds: 5));
          emit(DumbFoodInitial());
        }
      } on DioException catch(e) {
        emit(DumbFoodError(error: DioExceptionHandler.handleException(e)));
        await Future.delayed(const Duration(seconds: 5));
        emit(DumbFoodInitial());
      }
    });
  }
}