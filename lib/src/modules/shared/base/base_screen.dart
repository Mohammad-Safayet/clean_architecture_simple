/// Author: Safayet Latif
/// Description: This abstract class, `BaseScreen`, serves as the foundation
/// for building screens in the application. It provides a consistent structure
/// for defining screen elements such as the app bar, body content, and user
/// interface settings like status bar and background colors.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

import 'package:chuck_norris/src/core/config/config.dart';

/// An abstract class representing the base screen for the application.
abstract class BaseScreen extends StatelessWidget {
  BaseScreen({
    Key? key,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  final Logger logger = BuildConfig.instance.envConfig.logger;

  @override
  Widget build(BuildContext context) {
    return _annotatedRegion(
      context,
    );
  }

  /// Returns the app bar for the screen.
  PreferredSizeWidget? appBar(BuildContext context);

  /// Returns the body content for the screen.
  Widget body(BuildContext context);

  Widget _annotatedRegion(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        // Status bar color for Android
        statusBarColor: statusBarColor(context),
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Material(
        color: Colors.transparent,
        child: _pageScaffold(context),
      ),
    );
  }

  Widget _pageScaffold(BuildContext context) {
    return Scaffold(
      backgroundColor: pageBackgroundColor(context),
      key: globalKey,
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(context),
      body: pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(),
      bottomSheet: bottomSheet(),
    );
  }

  Widget pageContent(BuildContext context) {
    return SafeArea(
      child: body(context),
    );
  }

  /// Returns the background color of the screen.
  Color pageBackgroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.surfaceVariant;
  }

  /// Returns the floating action button for the screen.
  Widget? floatingActionButton(BuildContext context) {
    return null;
  }

  /// Returns the bottom navigation bar for the screen.
  Widget? bottomNavigationBar() {
    return null;
  }

  /// Returns the drawer for the screen.
  Widget? drawer() {
    return null;
  }

  /// Returns the bottom sheet for the screen.
  Widget? bottomSheet() {
    return null;
  }

  /// Returns the status bar color for the screen.
  Color statusBarColor(BuildContext context) {
    return Theme.of(context).colorScheme.onPrimary;
  }
}
