import 'dart:io';

import 'package:dream_stock/api_service/api_interceptor.dart';
import 'package:dream_stock/common/constant/api_constant.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

enum Method { POST, GET, PUT, DELETE, PATCH }

class RestClient extends GetxService {
  late Dio _dio;

  Future<RestClient> init() async {
    _dio = Dio(BaseOptions(baseUrl: ApiConstant.baseUrl, /*headers: header()*/))..interceptors.add(ApiInterceptors());
    //initInterceptors();
    return this;
  }

  Future<Map<String, dynamic>> request(
      String url, Method method, dynamic params) async {
   // Response response;
    Response response;
    try {
      if (method == Method.POST) {
        response = await _dio.post(url, data: params);
      } else if (method == Method.DELETE) {
        response = await _dio.delete(url);
      } else if (method == Method.PATCH) {
        response = await _dio.patch(url);
      } else {
        response = await _dio.get(
          url,
          queryParameters: params,
        );
      }

      if (response.statusCode == 200) {
        return response.data;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something Went Wrong");
      }
    } on SocketException catch(e) {
      throw Exception("No Internet Connection");
    } on FormatException {
      throw Exception("Bad Response Format!");
    } on DioError catch (e){
      throw Exception(e);
    } catch (e) {
      throw Exception("Something Went Wrong");
    }
  }
}