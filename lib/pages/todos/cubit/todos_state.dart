part of 'todos_cubit.dart';

class TodosState {
  ApiResult<List<Todo>> todosResult;

  TodosState({
    required this.todosResult,
  });

  factory TodosState.initial() => TodosState(todosResult: ApiResult());

  TodosState copyWith({
    ApiResult<List<Todo>>? todosResult,
  }) {
    return TodosState(
      todosResult: todosResult ?? this.todosResult,
    );
  }
}
