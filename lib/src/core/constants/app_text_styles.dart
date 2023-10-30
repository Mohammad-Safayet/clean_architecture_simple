import 'package:flutter/material.dart';

import 'app_values.dart';

abstract class AppTextStyles {
  static const captions = TextStyle(
    fontSize: AppValues.fontSize_12,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w400,
    color: Colors.black45,
  );

  static const displayBig = TextStyle(
    height: 1.2,
    fontSize: AppValues.fontSize_72,
    letterSpacing: 0.85,
    fontWeight: FontWeight.w600,
  );

  static const display = TextStyle(
    fontSize: AppValues.fontSize_64,
    letterSpacing: 0.15,
    fontWeight: FontWeight.w600,
  );

  static const displaySmall = TextStyle(
    fontSize: AppValues.fontSize_56,
    letterSpacing: 0.15,
    fontWeight: FontWeight.w400,
  );

  static const displayXSmall = TextStyle(
    fontSize: AppValues.fontSize_38,
    letterSpacing: 0.15,
    fontWeight: FontWeight.w400,
  );

  static const title = TextStyle(
    fontSize: AppValues.fontSize_16,
    letterSpacing: 0.15,
    fontWeight: FontWeight.w400,
  );

  static const titleBold = TextStyle(
    fontSize: AppValues.fontSize_16,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w700,
  );

  static const titleLarge = TextStyle(
    fontSize: AppValues.fontSize_20,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w700,
  );

  static const titleLight = TextStyle(
    fontSize: AppValues.fontSize_20,
    letterSpacing: 0.5,
    fontWeight: FontWeight.w400,
  );

  static const titleSmall = TextStyle(
    fontSize: AppValues.fontSize_12,
    letterSpacing: 0.125,
    fontWeight: FontWeight.w500,
  );

  static const subTitle = TextStyle(
    fontSize: AppValues.fontSize_14,
    letterSpacing: 0.125,
    fontWeight: FontWeight.w400,
  );

  static const bodyLarge = TextStyle(
    fontSize: AppValues.fontSize_16,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w600,
  );

  static const body = TextStyle(
    fontSize: AppValues.fontSize_14,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w400,
  );

  static const bodySmall = TextStyle(
    fontSize: AppValues.fontSize_12,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w300,
  );

  static const bodySmallBold = TextStyle(
    fontSize: AppValues.fontSize_12,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w500,
  );

  static const appBarTitleLarge = TextStyle(
    fontSize: AppValues.fontSize_22,
    letterSpacing: 0.0,
    fontWeight: FontWeight.w400,
  );

  static const appBarTitle = TextStyle(
    fontSize: AppValues.fontSize_16,
    letterSpacing: 0.15,
    fontWeight: FontWeight.w500,
  );

  static const appBarTitleSmall = TextStyle(
    fontSize: AppValues.fontSize_14,
    letterSpacing: 0.1,
    fontWeight: FontWeight.w500,
  );

  static const errorTitle = TextStyle(
    fontSize: AppValues.fontSize_20,
    letterSpacing: 0.15,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const errorDesc = TextStyle(
    fontSize: AppValues.fontSize_12,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static const errorButton = TextStyle(
    fontSize: AppValues.fontSize_12,
    letterSpacing: 0.25,
    fontWeight: FontWeight.w600,
  );

}
