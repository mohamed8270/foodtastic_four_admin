import 'package:dio/dio.dart';
import 'package:foodtastic_four_admin/features/authentication/models/user_register_model.dart';
import 'package:foodtastic_four_admin/features/products/models/food_order_model.dart';
import 'package:foodtastic_four_admin/features/products/models/food_products_model.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/error_logger.dart';


part 'api_service.g.dart';

@RestApi(baseUrl: 'https://campus-craves-server.onrender.com/api/v1')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // 1) staff register API call
  @POST('/staff/signup')
  Future<Map<String, String>> registerStaff(@Body() Map<String, dynamic> body);

  // 2) staff login API call
  @POST('/staff/login')
  Future<void> logInStaff(@Body() Map<String, dynamic> body);

  // 3) staff profile data
  @GET('/staff/profile')
  Future<UserRegisterModel> getStaffProfile(@Header('Authorization') String token);

  // 4) upload food data to the server
  @POST('/product/dumb')
  Future<Map<String, String>> insertFoodData(@Body() Map<String, dynamic> body);

  // load all the food data
  @GET('/product/load')
  Future<List<FoodProductsModel>> getFoodProducts();

  // delete food items
  @POST('/product/remove')
  Future<Map<String, String>> removeFoodData(@Body() Map<String, dynamic> body);

  // get all ordered food
  @GET('/food/orders/staff')
  Future<List<FoodOrderModel>> getOrderedFood(@Body() Map<String, dynamic> body);

  // make order delivered
  @POST('/food/order/staff/delivery')
  Future<Map<String, String>> deliveredFoodData(@Body() Map<String, dynamic> body);
}