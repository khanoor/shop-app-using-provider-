import 'package:producthub/res/api/base_api.dart';

import '../data/network/NetworkApiService.dart';
import '../data/network/baseapiService.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(baseApi.productApi, data);
    } catch (e) {
      throw e;
    }
  }
}
