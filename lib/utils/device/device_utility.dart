import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FDeviceUtility {
  // status bar color
  static Future<void> setStatusBarColor(Color bgColor, Brightness icnColor) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: bgColor, statusBarIconBrightness: icnColor),
    );
  }

  // get device size
  static Size getDeviceSize(BuildContext context) {
    return MediaQuery.sizeOf(context);
  }

  // vibrate
  static void setVibrate(Duration duration) {
    HapticFeedback.vibrate();
    Future.delayed(duration, () => HapticFeedback.vibrate);
  }
}