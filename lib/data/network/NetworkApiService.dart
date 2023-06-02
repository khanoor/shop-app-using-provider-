import 'dart:convert';
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
      responseJosn = jsonDecode(response.body);
    } on SocketException {
      throw FetchDataException("No Internet connection");
    }
    return responseJosn;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = response.body;
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }
}
