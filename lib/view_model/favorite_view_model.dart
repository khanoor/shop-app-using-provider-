import 'package:flutter/material.dart';

import '../model/product_model.dart';

class FavoriteProduct with ChangeNotifier {
  List<ProductDescription> _selectedItem = [];
  List get selectedItem => _selectedItem;
  void addItem(ProductDescription value) {
    _selectedItem.add;
    notifyListeners();
  }

  void removeItem(ProductDescription value) {
    _selectedItem.remove;
    notifyListeners();
  }
}
