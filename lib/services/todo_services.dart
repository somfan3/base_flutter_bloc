import 'package:flutter_app_architecture/common/network/api_result.dart';
import 'package:flutter_app_architecture/common/network/client/auth_api_client.dart';
import 'package:flutter_app_architecture/common/services/service_helper.dart';
import 'package:flutter_app_architecture/core/config/api_config.dart';
import 'package:flutter_app_architecture/models/todo.dart';

class TodoServices with ServiceHelper {
  TodoServices._();

  static final TodoServices instance = TodoServices._();

  factory TodoServices() => instance;

  Future<ApiResult<List<Todo>>> getListTodo() async {
    return getData<List<Todo>>(() async {
      final response = await AuthApiClient.instance.get(ApiConfig.todos);
      return List<Todo>.from(response.data.map((x) => Todo.fromJson(x)));
    });
  }
}
