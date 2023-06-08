import 'package:producthub/res/api/base_api.dart';

import '../data/network/NetworkApiService.dart';
import '../data/network/baseapiService.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> getProductDetails() async {
    try {
      dynamic response = await _apiServices.getGetResponse(
        baseApi.productApi,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> postLoginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(baseApi.loginApi, data);
          return response;
    } catch (e) {
      throw e;
    }
  }

  // Future<dynamic> loginApi(dynamic data) async {
  //   try {
  //     dynamic response =
  //         await _apiServices.getPostApiResponse(baseApi.productApi, data);
  //   } catch (e) {
  //     throw e;
  //   }
  // }
}
