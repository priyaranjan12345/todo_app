// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:todo_app/features/todo/presentation/pages/add_todo_pages/add_todo_page.dart'
    deferred as _i1;
import 'package:todo_app/features/home/home_page.dart' deferred as _i3;
import 'package:todo_app/features/todo/presentation/pages/todo_pages/todo_page.dart'
    deferred as _i4;
import 'package:todo_app/shared/dialogs/confirm_dialog.dart' deferred as _i2;

/// generated route for
/// [_i1.AddTodoPage]
class AddTodoRoute extends _i5.PageRouteInfo<void> {
  const AddTodoRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AddTodoRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTodoRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i5.DeferredWidget(
        _i1.loadLibrary,
        () => _i1.AddTodoPage(),
      );
    },
  );
}

/// generated route for
/// [_i2.ConfirmDialog]
class ConfirmDialogRoute extends _i5.PageRouteInfo<void> {
  const ConfirmDialogRoute({List<_i5.PageRouteInfo>? children})
      : super(
          ConfirmDialogRoute.name,
          initialChildren: children,
        );

  static const String name = 'ConfirmDialogRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i5.DeferredWidget(
        _i2.loadLibrary,
        () => _i2.ConfirmDialog(),
      );
    },
  );
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i5.DeferredWidget(
        _i3.loadLibrary,
        () => _i3.HomePage(),
      );
    },
  );
}

/// generated route for
/// [_i4.TodoPage]
class TodoRoute extends _i5.PageRouteInfo<void> {
  const TodoRoute({List<_i5.PageRouteInfo>? children})
      : super(
          TodoRoute.name,
          initialChildren: children,
        );

  static const String name = 'TodoRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return _i5.DeferredWidget(
        _i4.loadLibrary,
        () => _i4.TodoPage(),
      );
    },
  );
}
