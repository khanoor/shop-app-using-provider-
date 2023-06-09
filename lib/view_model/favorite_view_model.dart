import 'package:flutter/material.dart';

import '../model/product_model.dart';

class FavoriteProduct with ChangeNotifier {
  List<ProductDescription> _selectedItem = [];
  List get selectedItem => _selectedItem;
  List _testProduct = [];
  List get testProduct => _testProduct;

  void addItem(ProductDescription value) {
    _selectedItem.add;

    notifyListeners();
  }

  void addTest(value) {
    _testProduct.add(value);
    notifyListeners();
  }

  void removeTest(value) {
    _testProduct.remove(value);
    notifyListeners();
  }

  void removeItem(ProductDescription value) {
    _selectedItem.remove;
    notifyListeners();
  }
}
