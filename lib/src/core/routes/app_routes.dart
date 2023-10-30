part of 'app_pages.dart';

abstract class Routes {
  static const HOME = _Path.HOME;
  static const COUNTER = _Path.COUNTER;
}

abstract class _Path {
  static const HOME = "/";
  static const COUNTER = "/counter";
}
