import 'package:flutter_app_architecture/common/global_loading/global_loading.dart';
import 'package:flutter_app_architecture/common/network/api_result.dart';
import 'package:flutter_app_architecture/models/todo.dart';
import 'package:flutter_app_architecture/services/todo_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosState.initial());

  Future<void> getTodos() async {
    LoadingController.instance.show();
    emit(
      state.copyWith(
        todosResult: state.todosResult.copyWidth(state: ApiState.loading),
      ),
    );
    final result = await TodoServices.instance.getListTodo();
    emit(state.copyWith(todosResult: result));
    LoadingController.instance.hide();
  }
}
