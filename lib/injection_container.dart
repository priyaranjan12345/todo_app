import 'package:get_it/get_it.dart';

import 'core/router/app_router.dart';

final injector = GetIt.instance;

final appRouter = AppRouter();

Future<void> init() async {
  injector.registerLazySingleton(
    () => appRouter,
  );
  
}
