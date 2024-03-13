import 'package:dio/dio.dart';
import 'package:flutter_app_architecture/core/config/api_config.dart';

class DioBuilder {
  const DioBuilder._();

  static Dio createDio({
    BaseOptions? options,
  }) {
    return Dio(
      BaseOptions(
        connectTimeout: options?.connectTimeout ??
            const Duration(milliseconds: ApiConfig.connectionTimeout),
        receiveTimeout: options?.receiveTimeout ??
            const Duration(milliseconds: ApiConfig.receiveTimeout),
        sendTimeout: options?.sendTimeout ??
            const Duration(milliseconds: ApiConfig.sendTimeoutInMs),
        baseUrl: options?.baseUrl ?? "",
      ),
    );
  }
}
