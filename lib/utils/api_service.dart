
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  // Future<Map<String, dynamic>> get({required String endpoint}) async {
  //   Response response = await _dio.get("$endpoint");
  //   return response.data;
  // }

  Future<Map<String, dynamic>> get(
      {required String url,
      Map<String, String>? headers,
      @required String? token}) async {
    // _dio.options.headers['Authorization'] = 'Bearer ${token ?? ""}';
    Response response = await _dio.get(
      url,
      options: Options(
        // contentType: 'application/x-www-form-urlencoded',
        headers: headers ?? {'Authorization': 'Bearer ${token ?? ""}'},
      ),
    );
    return response.data;
  }

}
