import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'api_const.dart';

class Network {
  Dio _dio = Dio(BaseOptions(baseUrl: ApiConst.BASE_URL));

  Future<Response> get({String url, Map<String, dynamic> params}) async {
    try {
      return await _dio.get(url, queryParameters: params);
    } on DioError catch (e) {
      print("DioError: ${e.toString()}");
      return null;
    }
  }

}
