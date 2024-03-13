import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app_architecture/common/network/interceptor/log_interceptor.dart';

class ApiClientDefaultSetting {
  const ApiClientDefaultSetting._();

  // required interceptors
  static List<Interceptor> requiredInterceptors() => [
        if (kDebugMode) LoggingInterceptor(),
        // ConnectivityInterceptor(),
        // RetryOnErrorInterceptor(dio),
      ];
}
