import 'dart:io';

abstract class BaseException implements Exception {
  final String message;

  BaseException({required this.message});
}

class LocationPermissionDeniedException extends BaseException {
  LocationPermissionDeniedException({
    required String message,
  }) : super(message: message);
}

class LocationPermissionDeniedForeverException extends BaseException {
  LocationPermissionDeniedForeverException({
    required String message,
  }) : super(message: message);
}

class ApiException extends BaseException {
  final int httpCode;
  final String status;

  ApiException({
    required this.httpCode,
    required this.status,
    required String message,
  }) : super(message: message);
}

class ApplicationException extends BaseException {
  ApplicationException({required super.message});
}

class JsonFormatException extends BaseException {
  JsonFormatException({required super.message});
}

class NetworkException extends BaseException {
  NetworkException({required super.message});
}

class NotFoundException extends ApiException {
  NotFoundException({required String status, required String message})
      : super(
          httpCode: HttpStatus.notFound,
          status: status,
          message: message,
        );
}

class ServiceUnavailableException extends ApiException {
  ServiceUnavailableException({required String status, required String message})
      : super(
          httpCode: HttpStatus.serviceUnavailable,
          status: status,
          message: message,
        );
}

class TimeoutException extends BaseException {
  TimeoutException({required super.message});
}

class UnauthorizedException extends ApiException {
  UnauthorizedException({required String status, required String message})
      : super(
          httpCode: HttpStatus.unauthorized,
          status: status,
          message: message,
        );
}
