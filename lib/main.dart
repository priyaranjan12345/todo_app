import 'package:flutter/material.dart';
import 'package:todo_app/core/router/app_router.dart';

import 'core/router/app_router_observer.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Todo app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: injector<AppRouter>().config(
        navigatorObservers: () => [
          AppRouterObserver(),
        ],
      ),
    );
  }
}
