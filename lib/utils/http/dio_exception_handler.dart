import 'package:dio/dio.dart';

class DioExceptionHandler {
  static String handleException(DioException e) {
    switch(e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.sendTimeout:
        return 'Request timeout. Unable to send data.';
      case DioExceptionType.receiveTimeout:
        return 'Response timeout. The server took long to respond.';
      case DioExceptionType.badResponse:
        return handleResponse(e.response);
      case DioExceptionType.cancel:
        return 'Request was cancelled.';
      case DioExceptionType.badCertificate:
        return 'The certificate included for response is bad.';
      case DioExceptionType.connectionError:
        return 'Connection error. There is an error while connecting server.';
      case DioExceptionType.unknown:
        return 'Something went wrong. Please try again.';
      default:
        return 'Unexpected error';
    }
  }


  static String handleResponse(Response? res) {
    if(res == null) return 'No response from server';
    switch(res.statusCode) {
      case 400:
        return 'Bad request. Please check your inputs.';
      case 401:
        return 'Unauthorized. Please log in again.';
      case 403:
        return "Forbidden. You don't have permission to access this.";
      case 404:
        return "Not found. The resource you're looking for doesn't exist.";
      case 500:
        return 'Something went wrong. Please try again later.';
      case 501:
        return 'Internal server error. PLease try again later.';
      default:
        return 'Error ${res.statusCode}: ${res.statusMessage}';
    }
  }
}