/// Author:  Safayet Latif
/// Date: October 25, 2023
/// Description: This Dart class provides network-related functionality using the Dio library, handles authentication tokens, and content type configuration.

import 'package:chuck_norris/src/core/config/config.dart';
import 'package:chuck_norris/src/core/utils/network/network_request_header.dart';
import 'package:dio/dio.dart';

/// A class responsible for providing network-related functionality using the Dio library.
class NetworkProvider {
  static Dio? _instance;

  static final BaseOptions _options = BaseOptions(
    baseUrl: BuildConfig.instance.envConfig.baseUrl,
    connectTimeout: const Duration(
      seconds: 60,
    ),
    receiveTimeout: const Duration(
      seconds: 60,
    ),
  );

  /// Returns a Dio instance for making HTTP requests.
  static Dio get httpDio {
    if (_instance == null) {
      _instance = Dio(_options);

      return _instance!;
    } else {
      _instance!.interceptors.clear();

      return _instance!;
    }
  }

  /// Returns a Dio instance with added interceptors for handling authentication tokens.
  static Dio get tokenClient {
    _addInterceptors();

    return _instance!;
  }

  /// Returns a Dio instance with added interceptors for handling authentication tokens.
  static Dio get dioWithHeaderToken {
    _addInterceptors();

    return _instance!;
  }

  static _addInterceptors() {
    _instance ??= httpDio;
    _instance!.interceptors.clear();
    _instance!.interceptors.add(RequestHeaderInterceptor());
  }

  /// Sets the content type for requests based on the provided version.
  NetworkProvider.setContentType(String version) {
    _instance?.options.contentType = _buildContentType(version);
  }

  /// Sets the content type for requests to "application/json".
  NetworkProvider.setContentTypeApplicationJson() {
    _instance?.options.contentType = "application/json";
  }

  String _buildContentType(String version) {
    return "user_defined_content_type+$version";
  }
}
