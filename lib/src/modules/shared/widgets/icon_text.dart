import 'package:flutter/material.dart';

import 'package:chuck_norris/src/core/constants/app_text_styles.dart';
import 'package:chuck_norris/src/core/constants/app_values.dart';

class IconTextWidget extends StatelessWidget {
  const IconTextWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: AppValues.space_4,
        ),
        Flexible(
          child: Text(
            text,
            style: AppTextStyles.titleSmall,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
