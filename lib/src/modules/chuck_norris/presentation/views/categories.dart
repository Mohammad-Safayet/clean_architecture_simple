import 'package:chuck_norris/src/modules/shared/widgets/ripple_button.dart';
import 'package:flutter/material.dart';

import 'package:chuck_norris/src/core/utils/error_handling/error_handling.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/entities/categories.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/usecases/get_categories_usecase.dart';
import 'package:chuck_norris/src/core/constants/app_values.dart';
import 'package:chuck_norris/src/core/utils/di/di.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/repositories/jokes_repo_impl.dart';
import 'package:chuck_norris/src/modules/shared/base/base_view.dart';
import 'package:chuck_norris/src/modules/chuck_norris/presentation/widgets/error.dart';

class CategoriesView extends BaseView<Categories> {
  final Function voidCallback;
  final String activeItemName;

  CategoriesView({
    required this.voidCallback,
    required this.activeItemName,
  });

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
          final listData = data.list[index];
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: AppValues.margin_4,
            ),
            child: RippleButton(
              onTap: () {
                voidCallback(listData);
              },
              child: Chip(
                backgroundColor: (activeItemName == listData)
                    ? Theme.of(context).colorScheme.primaryContainer
                    : Theme.of(context).cardColor,
                label: Text(
                  listData,
                ),
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
}
