import 'package:foodtastic_four_admin/data/services/api_service.dart';
import 'package:foodtastic_four_admin/features/authentication/models/user_register_model.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository(this.apiService);

  // staff register
  Future<String?> staffRegister(Map<String, dynamic> body) async {
    final res = await apiService.registerStaff(body);
    return res['token'].toString();
  }

  // staff login
  Future<void> staffLogin(Map<String, dynamic> body) async {
    return await apiService.logInStaff(body);
  }

  // staff logout
  Future<String?> staffLogout() async {
    final res = await apiService.logOutStaff();
    return res['message'].toString();
  }

  // staff profile
  Future<UserRegisterModel> staffProfile(String token) async {
    return await apiService.getStaffProfile(token);
  }
}