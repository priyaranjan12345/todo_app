import 'dart:developer';

import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

/// This class observers all events happening in routing/navigation
class AppRouterObserver extends AutoRouterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    log(
      name: 'Navigation',
      'New route pushed: ${route.settings.name} Previous route is: ${previousRoute?.settings.name}',
    );
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    log(
      name: 'Navigation',
      'Previous route poped: ${route.settings.name} Active route is: ${previousRoute?.settings.name}',
    );
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    log(
      name: 'Navigation',
      'Route ${newRoute?.settings.name} is replaced with ${oldRoute?.settings.name}',
    );
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    log(
      name: 'Navigation',
      'Route ${route.settings.name} is removed. Previous route is:  ${previousRoute?.settings.name}',
    );
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    log(
      name: 'Navigation',
      'Tab route visited: ${route.name} Previous route is: ${previousRoute?.name}',
    );
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    log(
      name: 'Navigation',
      'Tab route re-visited: ${route.name} Previous route is: ${previousRoute.name}',
    );
  }
}
