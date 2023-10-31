/// Author: Safayet Latif
/// Description: This Dart extension provides methods for mapping exceptions to failure entities.

import 'package:chuck_norris/src/core/utils/error_handling/error_handling.dart';

/// A set of extension methods for converting exceptions to corresponding failure entities.
extension FailureEntityExtension on FailureEntity {
  /// Maps a [BaseException] to a [FailureEntity].
  ///
  /// This method takes a [BaseException] and maps it to a specific [FailureEntity]
  /// based on the type of exception. If the exception is of a known type, it constructs
  /// the appropriate failure entity with the necessary information.
  ///
  /// - [exception]: The exception to be mapped to a [FailureEntity].
  static FailureEntity mapToFailureEntity({
    required BaseException exception,
  }) {
    if (exception is ApiException) {
      return ApiFailure(
        title: "Code ${exception.httpCode}: ${exception.status}",
        message: exception.message,
      );
    } else if (exception is LocationPermissionDeniedForeverException) {
      return LocationPermissionFailure(
        exception: exception,
        title: "Location Access Permission is denied!",
        message: exception.message,
      );
    } else if (exception is LocationPermissionDeniedException) {
      return LocationPermissionFailure(
        exception: exception,
        title: "Location Access Permission is denied!",
        message: exception.message,
      );
    } else if (exception is JsonFormatException) {
      return JsonFormatFailure(
        title: "Bad Response",
        message: exception.message,
      );
    } else if (exception is NetworkException) {
      return NetworkingFailure(
        title: "Network Error",
        message: exception.message,
      );
    } else if (exception is NotFoundException) {
      return NotFoundFailure(
        title: "Code ${exception.httpCode}: ${exception.status}",
        message: exception.message,
      );
    } else if (exception is ServiceUnavailableException) {
      return ServiceUnavailableFailure(
        title: "Code ${exception.httpCode}: ${exception.status}",
        message: exception.message,
      );
    } else if (exception is TimeoutException) {
      return TimeoutFailure(
        title: "Connection Timeout Error",
        message: exception.message,
      );
    } else if (exception is UnauthorizedException) {
      return UnauthorizedFailure(
        title: "Code ${exception.httpCode}: ${exception.status}",
        message: exception.message,
      );
    } else {
      return ApplicationFailure(
        title: "Error Occurred",
        message: exception.message,
      );
    }
  }
}
