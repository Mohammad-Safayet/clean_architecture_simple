import 'package:flutter/material.dart';

import 'package:chuck_norris/src/modules/shared/widgets/app_bar_title.dart';


class ApplicationBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitleText;
  final List<Widget>? actions;
  final bool isBackButtonEnabled;
  final Widget? leadingIcon;

  const ApplicationBar({
    Key? key,
    required this.appBarTitleText,
    this.actions,
    this.isBackButtonEnabled = true,
    this.leadingIcon,
  }) : super(key: key);

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      elevation: 0.0,
      scrolledUnderElevation: 0.0,
      automaticallyImplyLeading: isBackButtonEnabled,
      actions: actions,
      iconTheme: IconThemeData(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      title: AppBarTitle(text: appBarTitleText),
      leading: leadingIcon,
    );
  }
}
