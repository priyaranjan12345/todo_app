import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/core/router/app_router.dart';
import 'package:todo_app/features/todo/data/datasource/todo_local_datasource.dart';
import 'package:todo_app/features/todo/domain/repository/todo_repository.dart';
import 'package:todo_app/features/todo/presentation/bloc/add_todo_bloc/add_todo_bloc.dart';
import 'package:todo_app/features/todo/presentation/bloc/todo_bloc/todo_bloc.dart';
import 'package:todo_app/injection_container.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    GetIt.instance.reset();
    await init();
  });

  test('GetIt should contain an instance of AppRouter', () {
    expect(GetIt.instance.isRegistered<AppRouter>(), true);
    expect(GetIt.instance<AppRouter>(), isA<AppRouter>());
  });

  test('GetIt should contain an instance of SharedPreferences', () {
    expect(GetIt.instance.isRegistered<SharedPreferences>(), true);
    expect(GetIt.instance<SharedPreferences>(), isA<SharedPreferences>());
  });

  test('GetIt should contain an instance of TodoLocalDatasource', () {
    expect(GetIt.instance.isRegistered<TodoLocalDatasource>(), true);
    expect(GetIt.instance<TodoLocalDatasource>(), isA<TodoLocalDatasource>());
  });

  test('GetIt should contain an instance of TodoRepository', () {
    expect(GetIt.instance.isRegistered<TodoRepository>(), true);
    expect(GetIt.instance<TodoRepository>(), isA<TodoRepository>());
  });

  test('GetIt should contain a factory for TodoBloc', () {
    expect(GetIt.instance.isRegistered<TodoBloc>(instanceName: null), true);
    expect(GetIt.instance<TodoBloc>(), isA<TodoBloc>());
  });

  test('GetIt should contain a factory for AddTodoBloc', () {
    expect(GetIt.instance.isRegistered<AddTodoBloc>(instanceName: null), true);
    expect(GetIt.instance<AddTodoBloc>(), isA<AddTodoBloc>());
  });
}
