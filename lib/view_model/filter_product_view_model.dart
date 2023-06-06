// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:producthub/res/api/base_api.dart';

import '../model/product_model.dart';
import '../repository/auth_repository.dart';

class FilterProduct with ChangeNotifier {
  bool _isSelected = false;
  List number = [];
  String catName = '';
  bool get isSelected => _isSelected;

  // void selectedProduct(bool value, int num) {
  //   _isSelected = value;
  //   number.add(num);
  //   notifyListeners();
  // }

  // void removeProduct(int num) {
  //   number.remove(num);
  //   notifyListeners();
  // }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
  }

  // void setcatName(String value) {
  //   catName = value;
  //   notifyListeners();
  // }

  List<ProductDescription> productList = [];
  List category = [];
  final _myRepo = AuthRepository();

  /// ***************** Get Product *************************///
  Future<void> getProductDetails(BuildContext context) async {
    setLoading(true);
    productList.clear();
    _myRepo.getProductDetails().then((value) {
      List data = value['products'];
      data.forEach((element) {
        ProductDescription model = ProductDescription.fromJson(element);
        productList.add(model);
        category.add(model.category);
      });
      category = category.toSet().toList();

      setLoading(false);
      notifyListeners();
    }).onError((error, stackTrace) {
      setLoading(false);
    });
  }
}
