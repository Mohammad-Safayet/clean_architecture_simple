import 'package:chuck_norris/src/modules/chuck_norris/infra/models/categories_model.dart';
import 'package:chuck_norris/src/modules/chuck_norris/infra/models/random_model.dart';

abstract class JokesRemoteDatasource {
  Future<RandomModel> getRandomJokes();

  Future<CategoriesModel> getJokesCategories();
}