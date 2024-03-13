import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_app_architecture/core/constants/api_constants.dart';
import 'package:flutter_app_architecture/core/local_storage/local_storage.dart';

class AuthedInterceptor extends InterceptorsWrapper {
  AuthedInterceptor();

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = LocalStorage.instance.accessToken;
    if (token.isNotEmpty) {
      options.headers[ApiConstants.basicAuthorization] =
          "${ApiConstants.bearer} $token";
    }
    return super.onRequest(options, handler);
  }

  @override
  Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    super.onResponse(response, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      /// Handle Unauthorized
      return handler.next(err);
    }

    return handler.next(err);
  }
}
