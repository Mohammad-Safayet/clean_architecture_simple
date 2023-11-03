import 'package:chuck_norris/src/core/extensions/models/chuck_norris/categories_model_extensions.dart';
import 'package:chuck_norris/src/core/extensions/models/chuck_norris/joke_model_extensions.dart';
import 'package:chuck_norris/src/modules/chuck_norris/infra/datasources/remote/jokes_remote_datasource.dart';
import 'package:chuck_norris/src/modules/chuck_norris/infra/repositories/jokes_repo.dart';

class JokesRepositoryImpl extends JokesRepository {
  final JokesRemoteDatasource datasource;

  JokesRepositoryImpl({
    required this.datasource,
  });

  @override
  Future getJokesCategories() async {
    try {
      final model = await datasource.getJokesCategories();
      final entity = model.toEntity();

      return entity;
    } catch(error) {
      rethrow;
    }
  }

  @override
  Future getRandomJoke() async {
    try {
      final model = await datasource.getRandomJoke();
      final entity = model.toEntity();

      return entity;
    } catch(error) {
      rethrow;
    }
  }
}
