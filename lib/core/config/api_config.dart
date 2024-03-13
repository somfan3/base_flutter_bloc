class ApiConfig {
  static const String baseUrl = "https://jsonplaceholder.typicode.com";
  static const int receiveTimeout = 60000;
  static const int connectionTimeout = 60000;
  static const int sendTimeoutInMs = 60000;

  static const header = {
    'content-Type': 'application/json',
  };

  static const headerFormData = {'Content-Type': 'multipart/form-data'};

  /// EndPoint
  static const String todos = "/todos";
}
