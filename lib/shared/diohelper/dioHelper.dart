// ignore_for_file: file_names, avoid_print

import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;
  
  static init() async {
    dio = Dio(BaseOptions(
      baseUrl: 'https://foora-go.predevsolutions.com/api/',
      receiveDataWhenStatusError: true,
    ));
  }
  static Future<Response> getData({
    required String url,
    required String? token,
  }) async {
    dio!.options.headers = {
      'Accept': 'application/json',
      "Authorization":"Bearer $token"
    };
    print(url);
    return await dio!.get(url);
  }
  static Future<Response> postData(
      {required url,  dynamic data, String? token,}) async {
    dio!.options.headers = {
      'Accept' :'application/json',
      "Authorization":"Bearer $token"
    }; 
    return await dio!.post(url, data: data);
  }

    static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    String? token,
  }) async {
     dio!.options.headers = {
      'Accept' :'application/json',
      "Authorization":"Bearer $token"
    };
    return dio!.put(url,data: data,);
  }
      static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    String? token,
  }) async {
     dio!.options.headers = {
      'Accept' :'application/json',
      "Authorization":"Bearer $token"
    };
    return dio!.delete(url,data: data,);
  }
}
