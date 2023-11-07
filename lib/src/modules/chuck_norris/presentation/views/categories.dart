import 'package:chuck_norris/src/core/utils/error_handling/error_handling.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/entities/categories.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/entities/categories.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/entities/categories.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/entities/categories.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/entities/categories.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/entities/categories.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/entities/categories.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/entities/categories.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/usecases/get_categories_usecase.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:chuck_norris/src/core/constants/app_text_styles.dart';
import 'package:chuck_norris/src/core/constants/app_values.dart';
import 'package:chuck_norris/src/core/utils/di/di.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/entities/joke.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/repositories/jokes_repo_impl.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/usecases/get_random_jokes_usecase.dart';
import 'package:chuck_norris/src/modules/shared/base/base_view.dart';

class CategoriesView extends BaseView<Categories> {
  @override
  Widget body(
    BuildContext context,
    Categories data,
    VoidCallback setState,
  ) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.list.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: AppValues.margin_4,
            ),
            child: Chip(
              label: Text(
                data.list[index],
              ),
            ),
          );
        },
      ),
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

    return Container(
      color: Theme.of(context).colorScheme.error,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data.title,
            style: AppTextStyles.errorTitle,
          ),
          Text(
            data.message,
            style: AppTextStyles.errorDesc,
          ),
          OutlinedButton(
            onPressed: () {
              getData();
              setState();
            },
            child: const Text(
              "Reload",
              style: AppTextStyles.errorButton,
            ),
          ),
        ],
      ),
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
}
