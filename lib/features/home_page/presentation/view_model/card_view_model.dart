import 'package:stroll_test/shared/data/repository/card_repository.dart';
import 'package:stroll_test/shared/data/model/favorite_option_response_model.dart';
import 'package:flutter/material.dart';

class CardViewModel extends ChangeNotifier {
  final CardRepository cardRepository;
  final LocalCardRepository localCardRepository;
  List<FavoriteOptionModel>? favoriteOptions;

  bool isFavoriteOptionLoading = false;

  int _selectedFavoriteOption = 0;

  int get selectedFavoriteOption => _selectedFavoriteOption;

  set selectedFavoriteOption(int value) {
    _selectedFavoriteOption = value;
    notifyListeners();
  }

  int _selectedPage = 0;

  int get selectedPage => _selectedPage;

  set selectedPage(int value) {
    _selectedPage = value;
    notifyListeners();
  }

  CardViewModel(this.cardRepository, this.localCardRepository){
    loadFavoriteOptions();
  }

  loadFavoriteOptions() async {
    favoriteOptions = await localCardRepository.getFavoriteOptions();
    isFavoriteOptionLoading = true;
    await Future.delayed(const Duration(seconds: 5));
    cardRepository.getFavoriteOptions().then((result) {
      favoriteOptions = result;
      isFavoriteOptionLoading = false;
      notifyListeners();
      localCardRepository.saveFavoriteOptions(FavoriteOptionResponseModel(status: "success",data: result));
    }).catchError((error) {
      isFavoriteOptionLoading = false;
      notifyListeners();
    });
  }
}
