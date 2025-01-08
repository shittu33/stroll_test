import 'package:get_it/get_it.dart';

import 'package:hive/hive.dart';


final getIt = GetIt.instance;

Future<void> initServiceLocator() async {

  //storage
  _registerStorage()

  // register datasources
  await _registerDatasource();

  // register repositories
  _registerRepositories();

  // register viewModels
  _registerViewModels();

  ///others
  _registerOthers();
}

// View models
void _registerStorage() {
  getIt.registerSingleton<Box>(
        () => Hive.box(),
  );
}

// View models
void _registerViewModels() {}

// Repositories
void _registerRepositories() {
  getIt.registerFactory<ProductRepository>(
    () => ProductRepository(localDataSource: getIt(), apiDataSource: getIt()),
  );
}

// data sources
Future<void> _registerDatasource() async {
  getIt
    ..registerFactory<LocalProductDataSource>(
      () => LocalProductDataSource(),
    )
    ..registerFactory<ApiProductDataSource>(
      () => ApiProductDataSource(),
    );
}

_registerOthers() async {}

