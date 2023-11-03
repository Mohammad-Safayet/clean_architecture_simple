import 'package:flutter/material.dart';

import 'package:chuck_norris/src/core/constants/app_values.dart';

class RippleButton extends StatelessWidget {
  final Function()? onTap;
  final Widget? child;
  final Color? rippleColor;
  final double rippleRadius;

  const RippleButton({
    Key? key,
    this.child,
    required this.onTap,
    this.rippleColor,
    this.rippleRadius = AppValues.radiusSmall,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(rippleRadius),
        highlightColor: rippleColor ?? Theme.of(context).splashColor,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
