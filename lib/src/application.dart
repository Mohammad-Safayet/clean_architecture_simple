import 'package:flutter/material.dart';

import 'package:chuck_norris/src/core/config/config.dart';
import 'package:chuck_norris/src/core/routes/app_pages.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final config = BuildConfig.instance.envConfig;
    final env = BuildConfig.instance.environment;

    return MaterialApp.router(
      title: config.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        // fontFamily: 'Montserrat',
      ),
      routerConfig: AppPages.routes,
      debugShowCheckedModeBanner: env == Environment.DEVELOPMENT,
    );
  }
}
