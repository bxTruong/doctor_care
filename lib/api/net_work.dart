import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'api_const.dart';

class Network {
  /*Dio _dio = Dio(BaseOptions(baseUrl: ApiConst.BASE_URL));

  Future<Response> get({String url, Map<String, dynamic> params}) async {
    try {
      return await _dio.get(url, queryParameters: params);
    } on DioError catch (e) {
      print("DioError: ${e.toString()}");
      return null;
    }
  }*/
  final String url;
  final Map<String, dynamic> data;

  Network({
    @required this.url,
    this.data,
  });

  Dio _dio() {
    return Dio();
  }

  void get({
    Function() beforeSend,
    Function(dynamic data) onSuccess,
    Function(dynamic error) onError,
  }) {
    _dio().get(this.url, queryParameters: this.data).then((res) {
      if (onSuccess != null) onSuccess(res.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }
}
