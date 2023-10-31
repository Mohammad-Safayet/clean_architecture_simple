import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:chuck_norris/src/core/utils/error_handling/exceptions.dart';

part 'failure_entity.freezed.dart';

@freezed
class FailureEntity with _$FailureEntity {
  const FailureEntity._();

  const factory FailureEntity.applicationFailure({
    required String title,
    required String message,
  }) = ApplicationFailure;

  const factory FailureEntity.locationPermissionFailure({
    required BaseException exception,
    required String title,
    required String message,
  }) = LocationPermissionFailure;

  const factory FailureEntity.apiFailure({
    required String title,
    required String message,
  }) = ApiFailure;

  const factory FailureEntity.jsonFormatFailure({
    required String title,
    required String message,
  }) = JsonFormatFailure;

  const factory FailureEntity.networkingFailure({
    required String title,
    required String message,
  }) = NetworkingFailure;

  const factory FailureEntity.notFoundFailure({
    required String title,
    required String message,
  }) = NotFoundFailure;

  const factory FailureEntity.serviceUnavailableFailure({
    required String title,
    required String message,
  }) = ServiceUnavailableFailure;

  const factory FailureEntity.timeoutFailure({
    required String title,
    required String message,
  }) = TimeoutFailure;

  const factory FailureEntity.unauthorizedFailure({
    required String title,
    required String message,
  }) = UnauthorizedFailure;
}
