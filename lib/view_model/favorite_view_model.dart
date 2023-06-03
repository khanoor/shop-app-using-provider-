import 'package:flutter/material.dart';

class FavoriteProduct with ChangeNotifier {
  // List<int> _favItem = [];
  List<int> favItem = [];

  get productList => null;

  void selectFavorite(int value) {
    favItem.add(value);
    notifyListeners();
  }
}
