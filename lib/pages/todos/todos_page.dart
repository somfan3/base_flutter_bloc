import 'package:flutter/material.dart';
import 'package:flutter_app_architecture/pages/todos/cubit/todos_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodosCubit(),
      child: const _TodosView(),
    );
  }
}

class _TodosView extends StatefulWidget {
  const _TodosView({super.key});

  @override
  State<_TodosView> createState() => _TodosViewState();
}

class _TodosViewState extends State<_TodosView> {
  late final _cubit = context.read<TodosCubit>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cubit.getTodos();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todos page',
        ),
      ),
      body: BlocBuilder<TodosCubit, TodosState>(
        builder: (context, state) {
          return state.todosResult.when(
            error: (message) => Center(
              child: Text(message),
            ),
            success: (data) {
              return ListView.builder(
                itemCount: data!.length,
                itemBuilder: (context, index) {
                  final todo = data[index];
                  return ListTile(
                    title: Text(todo.title ?? ""),
                    subtitle: Text(todo.completed.toString()),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
