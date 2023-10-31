import 'package:chuck_norris/src/modules/chuck_norris/infra/datasources/remote/jokes_remote_datasource.dart';
import 'package:chuck_norris/src/modules/chuck_norris/infra/models/categories_model.dart';
import 'package:chuck_norris/src/modules/chuck_norris/infra/models/random_model.dart';
import 'package:chuck_norris/src/modules/shared/base/base_remote_datasource.dart';

class JokesRemoteDatasourceImpl extends BaseRemoteDataSource
    implements JokesRemoteDatasource {
  @override
  Future<CategoriesModel> getJokesCategories() async {
    try {
      final endpoint = "${dioClient.options.baseUrl}jokes/categories";

      final api = dioClient.get(endpoint);

      final response = await callApiWithErrorParser(api);
      final json = {
        "list": response.data,
      };

      return CategoriesModel.fromJson(json);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<RandomModel> getRandomJokes() async {
    // TODO: implement getRandomJokes
    throw UnimplementedError();
  }
}
