import 'package:dio/dio.dart';
import 'package:flutter_app_architecture/common/network/api_result.dart';
import 'package:flutter_app_architecture/common/network/dio_exception.dart';

mixin ServiceHelper {
  Future<ApiResult<T>> getData<T>(
    Future<T> Function() apiCallback,
  ) async {
    var result = ApiResult<T>();
    try {
      final T data = await apiCallback();

      result = result.copyWidth(data: data, state: ApiState.success);
    } catch (e) {
      String message = "Something went wrong. Please try again later.";
      if (e is DioException) {
        message = CustomDioException.fromDioException(e).message;
      } else {
        message = "Something went wrong. Please try again later.";
      }
      result = result.copyWidth(state: ApiState.error, message: message);
    }

    return result;
  }
}
