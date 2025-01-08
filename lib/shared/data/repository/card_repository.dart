import 'package:stroll_test/shared/data/datasource/card_datasource.dart'

abstract class CardRepository {
  Future<List<CardModel>> getCards();

  Future<List<FavoriteOptionModel>> getFavoriteOptions();
}

class LocalCardRepository implements CardRepository {
  final LocalCardDataSource dataSource;

  LocalCardRepository(this.dataSource);

  Future<List<CardModel>> getCards() {
    return dataSource.getCards()
  }

  Future<List<FavoriteOptionModel>> getFavoriteOptions() {
    return dataSource.getFavoriteOptions();
  }

  Future saveFavoriteOptions(List<FavoriteOptionModel> data) async {
    dataSource.saveFavoriteOptions(data)
  }

  Future saveCards(List<CardModel> data) async {
    dataSource.saveCards(data)
  }
}