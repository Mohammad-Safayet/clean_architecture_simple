import 'package:chuck_norris/src/modules/chuck_norris/infra/repositories/jokes_repo.dart';
import 'package:chuck_norris/src/modules/shared/base/base_remote_datasource.dart';

class JokesRepositoryImpl extends JokesRepository {
  final BaseRemoteDatasource jokesDatasource;

  JokesRepositoryImpl({
    required this.jokesDatasource,
  });

  @override
  Future getJokesCategories() {
    // TODO: implement getJokesCategories
    throw UnimplementedError();
  }

  @override
  Future getJokesRandom() {
    // TODO: implement getJokesRandom
    throw UnimplementedError();
  }
}
