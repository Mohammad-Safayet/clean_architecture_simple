import 'package:chuck_norris/src/modules/chuck_norris/infra/datasources/remote/jokes_remote_datasource.dart';
import 'package:chuck_norris/src/modules/chuck_norris/infra/models/categories_model.dart';
import 'package:chuck_norris/src/modules/chuck_norris/infra/models/jokes_model.dart';
import 'package:chuck_norris/src/modules/shared/base/base_remote_datasource.dart';

class JokesRemoteDatasourceImpl extends BaseRemoteDatasource
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
  Future<JokeModel> getRandomJoke() async {
    try {
      final endpoint = "${dioClient.options.baseUrl}jokes/random";

      final api = dioClient.get(endpoint);

      final response = await callApiWithErrorParser(api);
      final json = response.data;
      logger.d(json);

      return JokeModel.fromJson(json);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<JokeModel> getJoke(String category) async {
    try {
      final endpoint = "${dioClient.options.baseUrl}jokes/random?category=$category";

      final api = dioClient.get(endpoint);

      final response = await callApiWithErrorParser(api);
      final json = response.data;
      logger.d(json);

      return JokeModel.fromJson(json);
    } catch (error) {
      rethrow;
    }
  }
}
