import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodtastic_four_admin/utils/constants/pages.dart';
import 'package:foodtastic_four_admin/utils/logging/logging.dart';

class LocalStorage {
  LocalStorage._();

  static List<String> images = [FAppImg.startUp, FAppImg.chinese, FAppImg.beveragesImg, FAppImg.northIndian, FAppImg.southIndian];
  static List<String> innerText = [FAppText.startUps, FAppText.chinese, FAppText.chinese, FAppText.northIndian, FAppText.southIndian];

  // store auth and other tokens
  static Future<void> storeToken(String token) async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    await storage.write(key: 'authToken', value: token);
  }

  // get auth token
  static Future<String?> token() async {
    FlutterSecureStorage storage = const FlutterSecureStorage();
    String? token = await storage.read(key: 'authToken');
    AppLogger.info(token.toString());
    return token;
  }
}