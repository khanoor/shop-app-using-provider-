import 'dart:io';

import 'package:producthub/data/app_exceptions.dart';
import 'package:producthub/data/network/baseapiService.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetResponse(String url) async {

    dynamic responseJosn;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
    } on SocketException {
      throw FetchDatException("No Internet connection");
    }
    return responseJosn;
  }

  @override
  Future getPostApiResponse(String url) {
    // TODO: implement getPostApiResponse
    throw UnimplementedError();
  }
}
