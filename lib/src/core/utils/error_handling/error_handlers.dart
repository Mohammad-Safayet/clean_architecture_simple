import 'package:chuck_norris/src/core/config/config.dart';
import 'package:chuck_norris/src/core/extensions/failure_entity_extension.dart';
import 'package:chuck_norris/src/core/utils/error_handling/exceptions.dart';
import 'package:chuck_norris/src/core/utils/error_handling/failure_entity.dart';

Exception handleError(String error) {
  final logger = BuildConfig.instance.envConfig.logger;
  logger.e("Generic exception: $error");

  return ApplicationException(message: error);
}

FailureEntity mapError(BaseException exception) {
  return FailureEntityExtension.mapToFailureEntity(
    exception: exception,
  );
}
