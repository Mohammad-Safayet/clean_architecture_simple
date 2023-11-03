import 'package:flutter/material.dart';
import 'package:chuck_norris/src/modules/shared/widgets/application_bar.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return const ApplicationBar(
      appBarTitleText: "Chuck Norris Facts",
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
