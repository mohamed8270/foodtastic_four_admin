import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtastic_four_admin/data/repository/food_order_repository.dart';
import 'package:foodtastic_four_admin/features/products/blocs/load_food_order/load_order_event.dart';
import 'package:foodtastic_four_admin/features/products/blocs/load_food_order/load_order_state.dart';
import 'package:foodtastic_four_admin/utils/http/dio_exception_handler.dart';
import 'package:foodtastic_four_admin/utils/local_storage/local_storage.dart';

class LoadOrderBloc extends Bloc<LoadOrderEvent, LoadOrderState> {
  final FoodOrderRepository foodOrderRepository;

  LoadOrderBloc(this.foodOrderRepository) : super(LoadOrderInitial()) {
    on<LoadOrder>((event, emit) async {
      emit(LoadOrderLoading());
      try {
        String? counter = await LocalStorage.counter();
        Map<String, dynamic> body = {'counter': counter};
        final foodOrders =  await foodOrderRepository.getFoodOrders(body);
        if(foodOrders.isEmpty) {
          emit(LoadOrderError(e: 'There is nothing to show! 🐟'));
        } else {
          emit(LoadOrderLoaded(foodOrders: foodOrders));
        }
      } on DioException catch(e) {
          emit(LoadOrderError(e: DioExceptionHandler.handleException(e)));
      }
    });
  }
}