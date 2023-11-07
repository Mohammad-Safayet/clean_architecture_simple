import 'package:chuck_norris/src/core/utils/error_handling/failure_entity.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/entities/joke.dart';
import 'package:chuck_norris/src/modules/chuck_norris/infra/repositories/jokes_repo.dart';
import 'package:chuck_norris/src/modules/shared/base/base_usecase.dart';

class GetRandomJokeUsecase extends BaseUsecase<Joke> {
  final JokesRepository repository;
  String _category = "";

  GetRandomJokeUsecase({required this.repository});

  set category(String value) {
    _category = value;
  }

  @override
  Future<Joke> getData() async {
    try {
      final data = await repository.getJoke(_category);

      return data;
    } catch (error) {
      rethrow;
    }
  }
}
