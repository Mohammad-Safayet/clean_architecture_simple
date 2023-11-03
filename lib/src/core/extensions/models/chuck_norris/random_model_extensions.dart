import 'package:intl/intl.dart';

import 'package:chuck_norris/src/modules/chuck_norris/domain/entities/random.dart';
import 'package:chuck_norris/src/modules/chuck_norris/infra/models/random_model.dart';

extension RandomModelExtension on RandomModel {
  Random toEntity() {
    return Random(
      categories: categories,
      createdAt: DateTime.parse(createdAt),
      updatedAt: DateTime.parse(updatedAt),
      iconUrl: iconUrl,
      id: id,
      url: url,
      value: value,
    );
  }
}
