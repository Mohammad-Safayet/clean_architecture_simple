import 'package:chuck_norris/src/core/constants/app_values.dart';
import 'package:chuck_norris/src/core/utils/di/di.dart';
import 'package:chuck_norris/src/core/utils/error_handling/error_handling.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/entities/categories.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/repositories/jokes_repo_impl.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/usecases/get_categories_usecase.dart';
import 'package:chuck_norris/src/modules/chuck_norris/infra/datasources/remote/jokes_remote_datasource_impl.dart';
import 'package:chuck_norris/src/modules/chuck_norris/presentation/views/categories.dart';
import 'package:chuck_norris/src/modules/chuck_norris/presentation/views/chuck_norries.dart';
import 'package:chuck_norris/src/modules/chuck_norris/presentation/views/joke.dart';
import 'package:chuck_norris/src/modules/chuck_norris/presentation/widgets/error.dart';
import 'package:chuck_norris/src/modules/shared/base/base_view.dart';
import 'package:flutter/material.dart';

class ChuckNorrisPage extends BaseView<Categories> {
  @override
  Widget body(
    BuildContext context,
    Categories data,
    VoidCallback setState,
  ) {
    return ChuckNorrisView(
      categories: data,
    );
  }

  @override
  Widget errorBody(
    BuildContext context,
    Object error,
    VoidCallback setState,
  ) {
    final FailureEntity data;

    if (error is FailureEntity) {
      data = error;
    } else {
      data = ApplicationFailure(
        message: error.toString(),
        title: 'Unexpected error occurred',
      );
    }

    return ErrorBodyWidget(
      data: data,
      onPressed: () {
        getData();
        setState();
      },
    );
  }

  @override
  Future<Categories> getData() async {
    final di = DependencyInjection.instance;
    final categoriesUsecase =
        GetCategoriesUsecase(repository: di.getIt<JokesRepositoryImpl>());

    final joke = await categoriesUsecase.call();

    final result = joke.fold((l) => l, (r) => r);

    if (result is Categories) {
      return result;
    } else {
      throw result as FailureEntity;
    }
  }

  static void registerDependencies() {
    final di = DependencyInjection.instance;

    di.register<JokesRemoteDatasourceImpl>(
      JokesRemoteDatasourceImpl(),
      DiType.SINGLETON,
    );

    di.register<JokesRepositoryImpl>(
      JokesRepositoryImpl(datasource: di.getIt<JokesRemoteDatasourceImpl>()),
      DiType.SINGLETON,
    );
  }
}
