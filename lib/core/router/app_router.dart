import 'package:flutter_app_architecture/core/constants/router_constants.dart';
import 'package:flutter_app_architecture/pages/todos/todos_page.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: RouterConstants.todos,
  routes: [
    GoRoute(
      path: RouterConstants.todos,
      builder: (context, state) {
        return const TodosPage();
      },
    ),
  ],
);
