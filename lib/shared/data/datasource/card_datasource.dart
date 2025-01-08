import 'package:stroll_test/shared/data/model/card_response_model.dart'
import 'package:stroll_test/shared/data/model/favorite_option_response_model.dart'
import 'package:stroll_test/shared/storage/stroll_storage.dart'

abstract class CardDataSource {
  Future<List<CardModel>> getCards();

  Future<List<FavoriteOptionModel>> getFavoriteOptions();
}


class LocalCardDataSource implements CardDataSource {
  LocalCardDataSource();

  @override
  Future<List<CardModel>> getCards() async {
    return StrollStorage.getData(cardStorageKey);
  }

  @override
  Future<List<FavoriteOptionModel>>? getFavoriteOptions() async {
    return StrollStorage.getData(favoriteStorageKey);
  }

  Future saveFavoriteOptions(List<FavoriteOptionModel> data) async {
    StrollStorage.saveData(favoriteStorageKey, data)
  }

  Future saveCards(List<CardModel> data) async {
    StrollStorage.saveData(cardStorageKey, data)
  }
}


class CardApiDataSource implements CardDataSource {
  CardApiDataSource();

  @override
  Future<List<CardModel>> getCards() async {
    return CardResponseModel
        .fromJson(testCardResponse)
        .data;
  }

  @override
  Future<List<FavoriteOptionModel>>? getCards() async {
    return FavoriteOptionResponseModel
        .fromJson(testLocalOptionsResponse)
        .data;
  }
}


const testOptionsResponse = {
  "status": "success",
  "data": [
    {
      "image": "/Users/apple/AndroidStudioProjects/Stroll_test/assets/png/morning.png",
      "symbol": "A",
      "text": "The peace in the early mornings"
    },
    {
      "image": "/Users/apple/AndroidStudioProjects/Stroll_test/assets/png/golden_sun.png",
      "symbol": "B",
      "text": "The magical golden hours"
    },
    {
      "image": "/Users/apple/AndroidStudioProjects/Stroll_test/assets/png/dinner.png",
      "symbol": "C",
      "text": "Wind-down time after dinners"
    },
    {
      "image": "/Users/apple/AndroidStudioProjects/Stroll_test/assets/png/night.png",
      "symbol": "D",
      "text": "The serenity past midnight"
    }
  ]
}

const testCardResponse = {
  "status": "success",
  "data": [
    {
      "title": "Morning",
      "type": "Peaceful"
    },
    {
      "title": "Golden Sun",
      "type": "Magical"
    },
    {
      "title": "Dinner",
      "type": "Relaxing"
    },
    {
      "title": "Night",
      "type": "Serene"
    }
  ]
}


