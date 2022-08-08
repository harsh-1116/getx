

import 'package:dio/dio.dart';
import 'package:dream_stock/api_service/rest_client.dart';

import '../common/constant/api_constant.dart';
import 'api_interceptor.dart';

class ApiUtil{
  /*static Dio? dio;

  static Dio getDio(){
    if (dio == null) {
      dio = Dio();
      dio!.options.connectTimeout = 60000;
      dio!.interceptors.add(ApiInterceptors());
    }
    return dio!;
  }*/

  // static Future<RestClient> getApiClient() {
  //   final restClient = RestClient().init();
  //   return restClient;
  // }

 /* static RestClient getApiClient() {
    final apiClient = RestClient(RestClient().init(), baseUrl: ApiConstant.baseUrl);
    return apiClient;
  }*/
}