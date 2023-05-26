import 'package:flutter/material.dart';

class FilterProduct with ChangeNotifier {
  bool _isSelected = false;
  List index = [];
  bool get isSelected => _isSelected;

  void selectedProduct(bool value, int num) {
    _isSelected = value;
    index.add(num);
    notifyListeners();
  }
}
