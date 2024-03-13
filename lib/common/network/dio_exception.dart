import 'package:dio/dio.dart';

class CustomDioException implements Exception {
  late String message;
  
  CustomDioException.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = 'Something went wrong';
        break;
      case DioExceptionType.connectionTimeout:
        message = 'Something went wrong';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Something went wrong';
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
          dioException.response?.statusCode,
          dioException.response?.data,
        );
        break;
      case DioExceptionType.sendTimeout:
        message = 'Something went wrong';
        break;
      case DioExceptionType.unknown:
        // if (dioException.message?.contains("SocketException") ?? false) {
        //   message = 'No Internet';
        //   break;
        // }
        message = 'Something went wrong';
        break;
      default:
        message = 'Something went wrong';
        break;
    }
  }

  String _handleError(int? statusCode, dynamic error) {
    // return error['message'];
    try {
      switch (statusCode) {
        case 400:
          return error['message'] ?? 'Something went wrong';
        case 401:
          return error['message'] ?? 'Something went wrong';
        case 403:
          return error['message'] ??'Something went wrong';
        case 404:
          return error['message'] ?? 'Something went wrong';
        case 500:
          return error['message'] ?? 'Something went wrong';
        case 502:
          return 'Something went wrong';
      }
    } catch (_) {}

    return 'Something went wrong';
  }

  @override
  String toString() => message;
}
