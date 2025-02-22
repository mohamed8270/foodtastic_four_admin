import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtastic_four_admin/data/repository/food_poduct_repository.dart';
import 'package:foodtastic_four_admin/features/products/blocs/food_remove/food_remove_event.dart';
import 'package:foodtastic_four_admin/features/products/blocs/food_remove/food_remove_state.dart';
import 'package:foodtastic_four_admin/utils/http/dio_exception_handler.dart';
import 'package:foodtastic_four_admin/utils/local_storage/local_storage.dart';
import 'package:foodtastic_four_admin/utils/logging/logging.dart';

class FoodRemoveBloc extends Bloc<FoodRemoveEvent, FoodRemoveState> {
  final FoodProductRepository foodProductRepository;

  FoodRemoveBloc(this.foodProductRepository) : super(FoodRemoveInitial()) {
    on<FoodRemove>((event, emit) async {
      emit(FoodRemoveLoading());
      try {
        String? employeeId = await LocalStorage.employee();
        Map<String, dynamic> body = {'employeeId': employeeId, 'id' : event.foodId};
        AppLogger.debug(body.toString());
        final res = await foodProductRepository.removeFoodData(body);
        AppLogger.debug(res.toString());
        emit(FoodRemoveLoaded(message: res.toString()));
      } on DioException catch(e) {
        emit(FoodRemoveError(e: DioExceptionHandler.handleException(e)));
      }
    });
  }
}