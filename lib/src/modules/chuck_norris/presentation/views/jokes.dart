import 'package:chuck_norris/src/core/utils/error_handling/error_handling.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:chuck_norris/src/core/constants/app_text_styles.dart';
import 'package:chuck_norris/src/core/constants/app_values.dart';
import 'package:chuck_norris/src/core/utils/di/di.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/entities/joke.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/repositories/jokes_repo_impl.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/usecases/get_random_jokes_usecase.dart';
import 'package:chuck_norris/src/modules/shared/base/base_view.dart';

class JokesView extends BaseView<Joke> {
  @override
  Widget body(
    BuildContext context,
    Joke data,
    VoidCallback setState,
  ) {
    return Container(
      padding: const EdgeInsets.all(
        AppValues.paddingLarge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Created at: ${DateFormat().add_yMMMMEEEEd().format(data.createdAt)}",
            style: AppTextStyles.captions,
          ),
          Text(
            data.value,
            style: AppTextStyles.bodyLarge,
          ),
          OutlinedButton(
            onPressed: () {
              getData();
              setState();
            },
            child: const Text("R E L O A D    N E W    F A C T"),
          ),
        ],
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
  Future<Joke> getData() async {
    final di = DependencyInjection.instance;
    final randomJokeUsecase =
        GetRandomJokeUsecase(repository: di.getIt<JokesRepositoryImpl>());

    final joke = await randomJokeUsecase.call();

    final result = joke.fold((l) => l, (r) => r);

    if (result is Joke) {
      return result;
    } else {
      throw result as FailureEntity;
    }
  }
}
