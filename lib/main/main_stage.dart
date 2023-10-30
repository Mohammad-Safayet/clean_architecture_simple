import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'package:chuck_norris/src/core/config/config.dart';
import 'package:chuck_norris/src/application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final envConfig = EnvConfig(
    appName: packageInfo.appName,
    appVersion: packageInfo.version,
  );

  BuildConfig.instantiate(
    config: envConfig,
    type: Environment.STAGING,
  );

  runApp(
    const Application(),
  );
}
