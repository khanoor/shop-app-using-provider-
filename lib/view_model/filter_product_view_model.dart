import 'package:flutter/material.dart';
import 'package:producthub/res/api/base_api.dart';

import '../model/product_model.dart';

class FilterProduct with ChangeNotifier {
  bool _isSelected = false;
  List number = [];
  bool get isSelected => _isSelected;

  void selectedProduct(bool value, int num) {
    _isSelected = value;
    number.add(num);
    notifyListeners();
  }

  void removeProduct(int num) {
    number.remove(num);
    notifyListeners();
  }
}

bool _isLoading = false;
bool get isLoading => _isLoading;

void setLoading(bool value) {
  _isLoading = value;
}

List<ProductDescription> productList = [];

/// ***************** Get Product *************************///
// Future<void> getAirportFlight(BuildContext context) async {
//   if (productList.length == 0) {
//     productList.clear();
//     setLoading(true);
//     getApi(baseApi.productApi).then((value) {
//       List data = value['data'];
//       data.forEach((element) {
//         ProductDescription model = ProductDescription.fromJson(element);
//         productList.add(model);
//       });
//       // searchAirportTempData = productList;
//       setLoading(false);
//       notifyListeners();
//     }).onError((error, stackTrace) {
//       setLoading(false);
//     });
//   }
// }
