import 'package:stroll_test/shared/data/datasource/card_datasource.dart';
import 'package:stroll_test/shared/data/model/favorite_option_response_model.dart';
import 'package:stroll_test/shared/data/model/card_response_model.dart';

abstract class CardRepository {
  Future<List<CardModel>?> getCards();

  Future<List<FavoriteOptionModel>?> getFavoriteOptions();
}

class LocalCardRepository implements CardRepository {
  final LocalCardDataSource dataSource;

  LocalCardRepository(this.dataSource);

  @override
  Future<List<CardModel>?> getCards() {
    return dataSource.getCards();
  }

  @override
  Future<List<FavoriteOptionModel>?> getFavoriteOptions() {
    return dataSource.getFavoriteOptions();
  }

  Future saveFavoriteOptions(FavoriteOptionResponseModel data) async {
    if (data != null) dataSource.saveFavoriteOptions(data);
  }

  Future saveCards(List<CardModel> data) async {
 dataSource.saveCards(data);
  }
}

class CardApiRepository implements CardRepository {
  final CardDataSource dataSource;

  CardApiRepository(this.dataSource);

  @override
  Future<List<CardModel>?> getCards() {
    return dataSource.getCards();
  }

  @override
  Future<List<FavoriteOptionModel>?> getFavoriteOptions() {
    return dataSource.getFavoriteOptions();
  }
}
