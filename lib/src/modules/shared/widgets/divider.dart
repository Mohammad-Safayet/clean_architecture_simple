import 'package:flutter/material.dart';
import 'package:chuck_norris/src/core/constants/app_values.dart';
import 'package:chuck_norris/src/modules/shared/base/base_widget_mixin.dart';

class DividerWidget extends StatelessWidget with BaseWidgetMixin {
  @override
  Widget? body(BuildContext context) {
    return Divider(
      color: Theme.of(context).colorScheme.inverseSurface.withOpacity(0.2),
      thickness: AppValues.dividerThickness,
      endIndent: AppValues.dividerIndent_5,
      indent: AppValues.dividerIndent_5,
    );
  }
}
