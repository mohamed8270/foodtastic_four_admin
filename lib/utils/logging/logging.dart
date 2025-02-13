import 'package:logger/logger.dart';

class Environment {
  static const bool isProduction = bool.fromEnvironment('dart.vm.product');
}

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 5,
      lineLength: 80,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.dateAndTime,
    ),
  );

  // debug log
  static void debug(String message) {
    _logger.d(message);
  }

  // info log
  static void info(String message) {
    _logger.i(message);
  }

  // warning log
  static void warning(String message) {
    _logger.w(message);
  }

  // error log
  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    _logger.e(message, error: error, stackTrace: stackTrace);
  }
}