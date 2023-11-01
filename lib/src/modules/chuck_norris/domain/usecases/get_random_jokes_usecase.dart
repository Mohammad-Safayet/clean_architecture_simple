import 'package:chuck_norris/src/core/utils/error_handling/failure_entity.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/entities/random.dart';
import 'package:chuck_norris/src/modules/chuck_norris/infra/repositories/jokes_repo.dart';
import 'package:chuck_norris/src/modules/shared/base/base_usecase.dart';

class GetRandomJokesUsecase extends BaseUsecase<Random> {
  final JokesRepository repository;

  GetRandomJokesUsecase({required this.repository});

  @override
  Future<Random> getData() async {
    try {
      final data = await repository.getJokesRandom();

      return data;
    } catch (error) {
      rethrow;
    }
  }
}
