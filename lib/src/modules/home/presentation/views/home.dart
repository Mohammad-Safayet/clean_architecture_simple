import 'package:chuck_norris/src/modules/chuck_norris/chuck_norris_page.dart';
import 'package:chuck_norris/src/modules/shared/base/base_widget_mixin.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget with BaseWidgetMixin {
  @override
  Widget? body(BuildContext context) {
    return ChuckNorrisPage();
  }
}
