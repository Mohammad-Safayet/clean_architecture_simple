import 'package:chuck_norris/src/modules/chuck_norris/domain/usecases/get_joke_usecase.dart';
import 'package:chuck_norris/src/modules/shared/base/base_usecase.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:chuck_norris/src/core/utils/di/di.dart';
import 'package:chuck_norris/src/core/constants/app_values.dart';
import 'package:chuck_norris/src/modules/shared/base/base_view.dart';
import 'package:chuck_norris/src/core/constants/app_text_styles.dart';
import 'package:chuck_norris/src/core/utils/error_handling/error_handling.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/entities/joke.dart';
import 'package:chuck_norris/src/modules/chuck_norris/presentation/widgets/error.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/repositories/jokes_repo_impl.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/usecases/get_random_jokes_usecase.dart';

class JokesView extends BaseView<Joke> {
  final String category;

  JokesView({required this.category,});

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

    return ErrorBodyWidget(
      data: data,
      onPressed: () {
        getData();
        setState();
      },
    );
  }

  @override
  Future<Joke> getData() async {
    final di = DependencyInjection.instance;
    final usecase;

    if(category == "random") {
      usecase = GetRandomJokeUsecase(repository: di.getIt<JokesRepositoryImpl>());
    } else {
      usecase = GetJokeUsecase(repository: di.getIt<JokesRepositoryImpl>());
      usecase.category = category;
    }

    final joke = await usecase.call();

    final result = joke.fold((l) => l, (r) => r);

    if (result is Joke) {
      return result;
    } else {
      throw result as FailureEntity;
    }
  }
}
