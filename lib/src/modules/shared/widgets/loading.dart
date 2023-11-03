import 'package:flutter/material.dart';

import 'package:chuck_norris/src/core/constants/app_values.dart';

class LoadingWidget extends StatelessWidget {
  final Color? bgColor;
  final EdgeInsetsGeometry padding;
  final double borderRadius;

  const LoadingWidget({
    Key? key,
    this.bgColor,
    this.padding = const EdgeInsets.all(AppValues.padding),
    this.borderRadius = 12.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: padding,
        height: AppValues.container_100,
        width: AppValues.container_100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).shadowColor.withOpacity(0.4),
              spreadRadius: 3,
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
          color: bgColor ??
              Theme.of(context).colorScheme.primaryContainer.withOpacity(
                    0.8,
                  ),
        ),
        child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
