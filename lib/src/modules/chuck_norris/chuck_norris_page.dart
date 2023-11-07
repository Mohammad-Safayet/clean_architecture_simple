import 'package:chuck_norris/src/core/constants/app_values.dart';
import 'package:chuck_norris/src/core/utils/di/di.dart';
import 'package:chuck_norris/src/modules/chuck_norris/domain/repositories/jokes_repo_impl.dart';
import 'package:chuck_norris/src/modules/chuck_norris/infra/datasources/remote/jokes_remote_datasource_impl.dart';
import 'package:chuck_norris/src/modules/chuck_norris/presentation/views/categories.dart';
import 'package:chuck_norris/src/modules/chuck_norris/presentation/views/chuck_norries.dart';
import 'package:chuck_norris/src/modules/chuck_norris/presentation/views/joke.dart';
import 'package:flutter/material.dart';

class ChuckNorrisPage extends StatelessWidget {
  const ChuckNorrisPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ChuckNorrisView();
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
