import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:producthub/utils/utils.dart';

import '../repository/auth_repository.dart';

class AuthViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get loading => _isLoading;
  setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

// Login Api post////////

  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.postLoginApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage("Login Successfully", context);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
