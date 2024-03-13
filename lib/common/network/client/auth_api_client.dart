import 'package:flutter_app_architecture/common/network/client/base/base_api_client.dart';
import 'package:flutter_app_architecture/common/network/interceptor/app_interceptor.dart';
import 'package:flutter_app_architecture/core/config/api_config.dart';

class AuthApiClient extends BaseApiClient {
  AuthApiClient._()
      : super(baseUrl: ApiConfig.baseUrl, interceptors: [AuthedInterceptor()]);

  static final instance = AuthApiClient._();

  factory AuthApiClient() {
    return instance;
  }
}
