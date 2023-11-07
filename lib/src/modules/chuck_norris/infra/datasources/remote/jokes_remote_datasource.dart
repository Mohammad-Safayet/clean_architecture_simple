import 'package:chuck_norris/src/modules/chuck_norris/infra/models/categories_model.dart';
import 'package:chuck_norris/src/modules/chuck_norris/infra/models/jokes_model.dart';

abstract class JokesRemoteDatasource {
  Future<JokeModel> getRandomJoke();

  Future<JokeModel> getJoke(String category);

  Future<CategoriesModel> getJokesCategories();
}