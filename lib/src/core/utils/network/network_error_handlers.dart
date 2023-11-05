/// Author: Safayet Latif
/// Description: This Dart module contains functions for handling network errors, particularly Dio exceptions, and mapping them to custom exceptions.

import 'dart:io';

import 'package:dio/dio.dart';

import 'package:chuck_norris/src/core/config/config.dart';
import 'package:chuck_norris/src/core/utils/error_handling/error_handling.dart';

Exception handleNetworkError(DioException dioError) {
  switch (dioError.type) {
    case DioExceptionType.cancel:
      return ApplicationException(
        message: "Request to API server was cancelled",
      );
    case DioExceptionType.connectionTimeout:
      return ApplicationException(
        message: "Connection timeout with API server",
      );
    case DioExceptionType.unknown:
      return NetworkException(
        message: "There is no internet connection",
      );
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.connectionError:
      return TimeoutException(
        message: "Connection timeout has occurred with API server",
      );
    case DioExceptionType.badCertificate:
      return ApplicationException(
        message: "Request was cancelled due to invalid certificate",
      );
    case DioExceptionType.badResponse:
      return _parseNetworkErrorResponse(dioError);
    default:
      return ApplicationException(
        message: "Unknown error occurred",
      );
  }
}

Exception _parseNetworkErrorResponse(DioException dioError) {
  final logger = BuildConfig.instance.envConfig.logger;

  int statusCode = dioError.response?.statusCode ?? -1;
  String? status;
  String? serverMessage;

  try {
    if (statusCode == -1 || statusCode == HttpStatus.ok) {
      statusCode = dioError.response?.data["statusCode"];
    }
    status = dioError.response?.data["status"];
    serverMessage = dioError.response?.data["message"];
  } catch (e, s) {
    logger.i("$e");
    logger.i(s.toString());

    serverMessage = "Something went wrong. Please try again later.";
  }

  switch (statusCode) {
    case HttpStatus.serviceUnavailable:
      return ServiceUnavailableException(
        status: status ?? "",
        message: "Service Temporarily Unavailable",
      );
    case HttpStatus.notFound:
      return NotFoundException(
        message: serverMessage ?? "",
        status: status ?? "",
      );
    default:
      return ApiException(
        httpCode: statusCode,
        status: status ?? "",
        message: serverMessage ?? "",
      );
  }
}
