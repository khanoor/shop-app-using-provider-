import 'package:flutter/material.dart';

class FavoriteProduct with ChangeNotifier {
  bool isfavorite = false;
  // bool get favorite => _isfavorite;

  void selectFavorite(bool value) {
    isfavorite = value;
    notifyListeners();
  }
}
