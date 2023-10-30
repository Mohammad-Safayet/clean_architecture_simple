import 'package:chuck_norris/src/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'app_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

abstract class AppPages {
  static final routes = GoRouter(
    initialLocation: Routes.COUNTER,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: Routes.HOME,
        builder: (context, state) {
          return  const HomePage(title: 'Flutter Demo Home Page');
        },
      ),
    ],
  );
}
