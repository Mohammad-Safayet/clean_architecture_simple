import 'package:flutter/material.dart';
import 'package:chuck_norris/src/core/constants/app_text_styles.dart';

class AppBarTitle extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final TextStyle textStyle;

  const AppBarTitle({
    Key? key,
    required this.text,
    this.textAlign = TextAlign.center,
    this.textStyle = AppTextStyles.appBarTitleLarge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle,
      textAlign: textAlign,
    );
  }
}
