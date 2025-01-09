import 'package:get_it/get_it.dart';
import 'package:stroll_test/shared/data/datasource/card_datasource.dart';
import 'package:stroll_test/shared/data/repository/card_repository.dart';
import 'package:stroll_test/shared/data/model/favorite_option_response_model.dart';
import 'package:stroll_test/features/home_page/presentation/view_model/card_view_model.dart';

import 'package:hive/hive.dart';


final getIt = GetIt.instance;

Future<void> initServiceLocator() async {

  //storage
  _registerStorage();

  // register datasources
  await _registerDatasource();

  // register repositories
  _registerRepositories();

  // register viewModels
  _registerViewModels();

  ///others
  _registerOthers();
}

// storage
void _registerStorage() {
  Hive.registerAdapter('FavoriteOptionModel', FavoriteOptionModel.fromJson);
  Hive.registerAdapter('FavoriteOptionResponseModel', FavoriteOptionResponseModel.fromJson);
  // getIt.registerSingleton(
  //       () => Hive.box(),
  // );
}

// data sources
Future<void> _registerDatasource() async {
  getIt
    ..registerFactory<CardDataSource>(
      () => CardApiDataSource(),
    )..registerFactory<LocalCardDataSource>(
      () => LocalCardDataSource(),
    );
}

// Repositories
void _registerRepositories() {
  getIt..registerFactory<CardRepository>(
        () => CardApiRepository(getIt()),
  )..registerFactory<LocalCardRepository>(
        () => LocalCardRepository(getIt()),
  );
}

// View models
void _registerViewModels() {
  getIt.registerFactory<CardViewModel>(()=> CardViewModel(getIt(), getIt()));
}


_registerOthers() async {}

