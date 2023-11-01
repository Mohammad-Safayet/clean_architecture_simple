import 'package:chuck_norris/src/modules/chuck_norris/domain/entities/categories.dart';
import 'package:chuck_norris/src/modules/chuck_norris/infra/models/categories_model.dart';

extension CategoriesModelExtension on CategoriesModel {
  Categories toModel() {
    return Categories(
      list: list,
    );
  }
}
