import 'package:flutter/material.dart';
import 'package:chuck_norris/src/core/config/config.dart';

mixin BaseWidgetMixin on StatelessWidget {
  final logger = BuildConfig.instance.envConfig.logger;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: body(context),
    );
  }

  Widget? body(BuildContext context);
}
