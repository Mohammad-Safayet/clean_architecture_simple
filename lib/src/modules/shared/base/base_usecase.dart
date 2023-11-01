/// Author: Safayet Latif
/// Description: This abstract class, `BaseUsecase`, defines the base structure
/// for use cases in the application. Use cases are responsible for executing
/// specific tasks or operations and returning results or errors.

import 'package:dartz/dartz.dart';

import 'package:chuck_norris/src/core/config/config.dart';
import 'package:chuck_norris/src/core/extensions/failure_entity_extension.dart';
import 'package:chuck_norris/src/core/utils/error_handling/error_handling.dart';

/// An abstract class representing a use case for the application.
/// The `BaseUsecase` abstract class defines the structure for creating use cases in the Weather App.
/// Use cases are responsible for executing specific tasks or operations and returning results or errors.
///
/// [Generic Type]
///
/// - `T`: The type of data that the use case will return.
///
/// [Fields]
///
/// - `logger`: An instance of the logger for logging messages and errors.
///
/// [Methods]
///
/// - `getData()`: An abstract method that should be implemented by concrete use cases to retrieve data.
/// - `call()`: Executes the use case and returns a result or failure.
/// - `mapExceptionToFailureEntity()`: Maps an exception to a `FailureEntity`.
///
/// [Example]
///
/// ```dart
/// class GetWeatherData extends BaseUsecase<WeatherData> {
///   @override
///   Future<WeatherData> getData() {
///     // Implement the logic to fetch weather data.
///   }
/// }
/// ```
abstract class BaseUsecase<T extends Object> {
  /// The logger for logging messages and errors.
  final logger = BuildConfig.instance.envConfig.logger;

  /// Retrieves the data asynchronously.
  ///
  /// Subclasses should implement this method to fetch data.
  Future<T> getData();

  /// Executes the use case and returns a result or failure.
  ///
  /// This method calls `getData()` and handles exceptions by mapping them to a `FailureEntity`.
  ///
  /// Returns a `Future` containing either the data as `Right` or a `FailureEntity` as `Left`.
  Future<Either<FailureEntity, T>> call() async {
    try {
      final data = await getData();
      return Right(data);
    } catch (error) {
      return Left(
        mapExceptionToFailureEntity(
          error as Exception,
        ),
      );
    }
  }

  /// Maps an exception to a `FailureEntity`.
  ///
  /// This method converts exceptions to a `FailureEntity` for consistent error handling.
  ///
  /// - [exception]: The exception to be mapped.
  ///
  /// Returns a `FailureEntity` representing the exception.
  FailureEntity mapExceptionToFailureEntity(Exception exception) {
    if (exception is BaseException) {
      return mapError(exception);
    } else {
      return FailureEntityExtension.mapToFailureEntity(
        exception: handleError("Unexpected error occurred") as BaseException,
      );
    }
  }
}