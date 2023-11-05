/// Author: Safayet Latif
/// Description: This Dart class, DependencyInjection, provides a simple
/// dependency injection framework using the GetIt package. It allows for
/// registration and retrieval of objects using different dependency injection
/// strategies.

import 'package:get_it/get_it.dart';

enum DiType {
  SINGLETON,
  LAZY_SINGLETON,
  FACTORY,
}

class DependencyInjection {
  final GetIt getIt = GetIt.instance;

  static final DependencyInjection _instance = DependencyInjection._internal();

  static DependencyInjection get instance => _instance;

  DependencyInjection._internal();

  void register<T extends Object>(
      T instance,
      DiType type,
      ) {
    final isRegistered = getIt.isRegistered<T>();

    if (isRegistered) return;

    switch (type) {
      case DiType.SINGLETON:
        getIt.registerSingleton(instance);
        break;
      case DiType.LAZY_SINGLETON:
        getIt.registerLazySingleton(() => instance);
        break;
      case DiType.FACTORY:
        getIt.registerFactory(instance as FactoryFunc<Object>);
        break;
    }
  }

  T getInstance<T extends Object>() {
    return getIt.get<T>();
  }
}
