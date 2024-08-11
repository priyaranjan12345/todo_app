import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/router/app_router.dart';
import 'features/todo/data/datasource/datasource.dart';
import 'features/todo/data/repository/todo_repository_impl.dart';
import 'features/todo/domain/repository/todo_repository.dart';
import 'features/todo/presentation/bloc/add_todo_bloc/add_todo_bloc.dart';
import 'features/todo/presentation/bloc/todo_bloc/todo_bloc.dart';

final injector = GetIt.instance;

Future<void> init() async {
  final sharedPreference = await SharedPreferences.getInstance();
  injector.registerLazySingleton(
    () => sharedPreference,
  );

  injector.registerLazySingleton<AppRouter>(
    () => AppRouter(),
  );

  injector.registerLazySingleton<TodoLocalDatasource>(
    () => TodoLocalDatasourceImpl(preferences: injector()),
  );

  injector.registerLazySingleton<TodoRepository>(
    () => TodoRepositoryImpl(
      datasource: injector(),
    ),
  );

  injector.registerFactory(
    () => TodoBloc(
      repository: injector(),
    ),
  );

  injector.registerFactory(
    () => AddTodoBloc(
      repository: injector(),
    ),
  );
}
