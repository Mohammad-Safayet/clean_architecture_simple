/// Author: Safayet Latif
/// Description: This abstract class, `BaseRemoteDataSource`, defines the
/// interface for remote data sources in the context of network requests.
/// It provides a base configuration for making API requests with error handling
/// using the Dio package and network error handlers.

import 'dart:io';

import 'package:dio/dio.dart';

import 'package:chuck_norris/src/core/config/config.dart';
import 'package:chuck_norris/src/core/utils/error_handling/error_handling.dart';
import 'package:chuck_norris/src/core/utils/network/network_provider.dart';
import 'package:chuck_norris/src/core/utils/network/network_error_handlers.dart';

/// An abstract class representing a remote data source for network requests.
abstract class BaseRemoteDataSource {
  /// The Dio client used for making API requests with headers.
  Dio get dioClient => NetworkProvider.dioWithHeaderToken;

  /// The logger instance for logging network-related information.
  final logger = BuildConfig.instance.envConfig.logger;

  /// Makes an API request with error handling and response parsing.
  ///
  /// This method takes a generic API request and handles Dio exceptions as well as custom error handling.
  ///
  /// Returns a [Response] containing the parsed API response data.
  Future<Response<T>> callApiWithErrorParser<T>(Future<Response<T>> api) async {
    try {
      Response<T> response = await api;

      if (response.statusCode != HttpStatus.ok ||
          (response.data as Map<String, dynamic>)['statusCode'] !=
              HttpStatus.ok) {
        // TODO: Handle the response error.
      }

      return response;
    } on DioException catch (dioError) {
      Exception exception = handleNetworkError(dioError);
      logger.e(
        "Throwing error from datasource: >>>>>>> $exception : ${(exception as BaseException).message}",
      );
      throw exception;
    } catch (error) {
      logger.e("Generic error: >>>>>>> $error");

      if (error is BaseException) {
        rethrow;
      }

      throw handleError("$error");
    }
  }
}