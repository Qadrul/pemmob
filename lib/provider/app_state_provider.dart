import 'package:flutter/material.dart';
import 'package:tes_1/models/anime.dart';

class AppStateProvider extends ChangeNotifier {
  List<Anime> _favorites = [];
  static const String _storageKey = 'favorite_anime_list';

  List<Anime> get favorites => _favorites;

  AppStateProvider

  bool isFavorite(String animeId) {
    return _favorites.any((anime) => anime.id == animeId);
  }

  void toggleFavorite(Anime anime) {
    if (isFavorite(anime.Id)) {
      removeFavorite(anime.id);
    } else {
      addFavorite(anime);
    }
  }

  void addFavorite(Anime anime){
    if (!isFavorite(anime.id)){
      _favorites.add(anime);
      _saveFavorites();
      notifyListeners();
    }
  }

  void removeFavorite(String animeId) {
    _favorites.removeWhere((anime) => anime.id == animeId);
    _saveFavorites();
    notifyListeners();
  }
  

}

