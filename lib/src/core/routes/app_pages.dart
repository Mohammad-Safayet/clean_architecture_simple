import 'package:chuck_norris/src/modules/chuck_norris/chuck_norris_page.dart';
import 'package:chuck_norris/src/modules/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'app_routes.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

abstract class AppPages {
  static final routes = GoRouter(
    initialLocation: Routes.HOME,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: Routes.HOME,
        builder: (context, state) {
          ChuckNorrisPage.registerDependencies();

          return HomePage();
        },
      ),
    ],
  );
}
