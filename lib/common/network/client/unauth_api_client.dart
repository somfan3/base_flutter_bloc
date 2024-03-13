import 'package:flutter_app_architecture/common/network/client/base/base_api_client.dart';
import 'package:flutter_app_architecture/core/config/api_config.dart';

class UnAuthApiClient extends BaseApiClient {
  UnAuthApiClient._() : super(baseUrl: ApiConfig.baseUrl);

  static final instance = UnAuthApiClient._();

  factory UnAuthApiClient() {
    return instance;
  }
}
