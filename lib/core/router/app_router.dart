import 'package:auto_route/auto_route.dart';
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
      ];
}
