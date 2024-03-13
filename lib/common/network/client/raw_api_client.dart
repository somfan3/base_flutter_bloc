
import 'package:flutter_app_architecture/common/network/client/base/base_api_client.dart';

class RawApiClient extends BaseApiClient {
  RawApiClient._() : super();

  static final instance = RawApiClient._();

  factory RawApiClient() {
    return instance;
  }
}
