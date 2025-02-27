import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodtastic_four_admin/data/repository/food_order_repository.dart';
import 'package:foodtastic_four_admin/features/products/blocs/food_delivered/food_deliver_event.dart';
import 'package:foodtastic_four_admin/features/products/blocs/food_delivered/food_deliver_state.dart';
import 'package:foodtastic_four_admin/utils/http/dio_exception_handler.dart';
import 'package:foodtastic_four_admin/utils/local_storage/local_storage.dart';

class FoodDeliverBloc extends Bloc<FoodDeliverEvent, FoodDeliverState> {
  final FoodOrderRepository foodOrderRepository;

  FoodDeliverBloc(this.foodOrderRepository) : super(FoodDeliverInitial()) {
    on<FoodDeliver>((event, emit) async {
      emit(FoodDeliverLoading());
      try {
        String? counter = await LocalStorage.counter();
        Map<String, dynamic> body = {'counter': counter.toString(), 'foodId': event.foodId};
        final res = await foodOrderRepository.deliverFoodOrders(body);
        emit(FoodDeliverLoaded(status: res.toString()));
      } on DioException catch(e) {
        emit(FoodDeliverError(error: DioExceptionHandler.handleException(e)));
      }
    });
  }
}