import 'package:chuck_norris/src/modules/chuck_norris/domain/entities/categories.dart';
import 'package:chuck_norris/src/modules/chuck_norris/infra/repositories/jokes_repo.dart';
import 'package:chuck_norris/src/modules/shared/base/base_usecase.dart';

class GetCategoriesUsecase extends BaseUsecase<Categories> {
  final JokesRepository repository;

  GetCategoriesUsecase({required this.repository});

  @override
  Future<Categories> getData() async {
    try {
      final data = await repository.getJokesCategories();

      return data;
    } catch (error) {
      rethrow;
    }
  }
}
