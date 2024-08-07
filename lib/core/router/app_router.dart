import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
          initial: true,
          children: [
            RedirectRoute(
              path: '',
              redirectTo: 'todo',
            ),
            AutoRoute(
              page: TodoRoute.page,
              path: 'todo',
            ),
            AutoRoute(
              page: AddTodoRoute.page,
              path: 'addTodo',
            ),
          ],
        ),
        CustomRoute(
          page: ConfirmDialogRoute.page,
          path: '/addTodoDialogRoute',
          customRouteBuilder: <T>(context, child, AutoRoutePage<T> page) {
            return DialogRoute(
              context: context,
              settings: page,
              builder: (_) => child,
            );
          },
        ),
      ];
}
