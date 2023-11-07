
import 'package:chuck_norris/src/modules/chuck_norris/domain/entities/joke.dart';
import 'package:chuck_norris/src/modules/chuck_norris/infra/models/jokes_model.dart';

extension RandomModelExtension on JokeModel {
  Joke toEntity() {
    return Joke(
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
