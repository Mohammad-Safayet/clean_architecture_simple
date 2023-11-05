import 'package:flutter/material.dart';

import 'package:chuck_norris/src/modules/home/presentation/views/home.dart';
import 'package:chuck_norris/src/modules/home/presentation/widgets/home_app_bar.dart';
import 'package:chuck_norris/src/modules/shared/base/base_screen.dart';

class HomePage extends BaseScreen {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return HomeAppBar();
  }

  @override
  Widget body(BuildContext context) {
    return HomeView();
  }

}
