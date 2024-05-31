import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:olearis_test/config/config.dart';
import 'package:olearis_test/ui/screens/screens.dart';

class AppNavigation {
  AppNavigation._();

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    initialLocation: SignInScreen.route,
    navigatorKey: _rootNavigatorKey,
    observers: [AppConstants.routeObserver],
    routes: [
      GoRoute(
        path: SignInScreen.route,
        name: SignInScreen.name,
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: HomeScreen.route,
        name: HomeScreen.name,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
