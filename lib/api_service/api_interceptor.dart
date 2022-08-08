import 'dart:convert';
// import 'dart:html';
import 'dart:io' show Platform;
import 'package:dio/dio.dart';
import 'package:dream_stock/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' as getX;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/constant/api_constant.dart';
import '../common/widgets/common_widgets.dart';


class ApiInterceptors extends InterceptorsWrapper {
  //int counter = 0;
  DioError? err1;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final method = options.method;
    final uri = options.uri;
    final data = options.data;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(Constants.authToken);
    if (options.uri.toString().contains("login") ||
        options.uri.toString().contains(("socialSignupCheck")) ||
        options.uri.toString().contains(("signup")) ||
        options.uri.toString().contains(("forgotPassword"))) {
      options.headers['auth_token'] = '${Constants.defaultToken}';
    } else {
      if (token != null) {
        options.headers['auth_token'] = token;
      }
    }
/*else {
      options.headers['auth_token'] = Constants.defaultToken;
    }*/
    if (options.uri.toString().contains('user/refreshToken')) {
      options.headers['refresh_token'] = Constants.refreshToken;
    }
    options.headers['language'] = 'en';
    options.headers['device_id'] = Constants.deviceId;
    options.headers['device_type'] = Platform.isAndroid ? "android" : "ios";
    options.headers['app_version'] = await PackageInfo.fromPlatform().then((value) => value.version);
    if (method == 'GET') {
      logger.log("✈️ REQUEST[$method] => PATH: $uri \n Token: ${options.headers}", printFullText: true);
    } else {
      try {
        logger.log("✈️ REQUEST[$method] => PATH: $uri \n Token:${options.headers} \n DATA: ${jsonEncode(data)}",
            printFullText: true);
      } catch (e) {
        logger.log("✈️ REQUEST[$method] => PATH: $uri \n Token: ${options.headers} \n DATA: $data",
            printFullText: true);
      }
    }
    //counter++;
    super.onRequest(options, handler);
  }


  @override
    Future<void> onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    final statusCode = response.statusCode;
    final uri = response.requestOptions.uri;
    final data = jsonEncode(response.data);
    logger.log("✅ RESPONSE[$statusCode] => PATH: $uri\n DATA: $data",
        printFullText: true);

    if (uri.toString() == "${ApiConstant.baseUrl}${ApiConstant.refreshTokenApi}") {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(Constants.authToken, response.data["data"]["token"]);
    }
    //handle error state
    if (response.data["code"] == 0) {
      EasyLoading.dismiss();
      if ((getX.Get.isDialogOpen != null && getX.Get.isDialogOpen == true) ||
          (getX.Get.isBottomSheetOpen != null &&
              getX.Get.isBottomSheetOpen == true)) {
        Navigator.of(getX.Get.overlayContext!).pop();
      }
      CommonWidgets().handleErrorDialog(
          response.data["message"].toString(), getX.Get.overlayContext!);
    } else {
      super.onResponse(response, handler);
    }
    //Handle section expired
  }

  @override
    Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode!;

    print("error----->>${err.error}");
    final uri = err.requestOptions.path;
    err1 = err;
    var data = "";
    // print("Error $uri $statusCode $err1" ;)
    try {
      data = jsonEncode(err.response!.data);

    } catch (e) {
      print("On Error Exception ${e}");
    }
    logger.log("⚠️ ERROR[$statusCode] => PATH: $uri\n DATA: $data",
        printFullText: true);
    super.onError(err, handler);
  }

    // Future<void> refreshToken() async {
    //   await postAPI('${ApiConstant.baseUrl+ApiConstant.refreshTokenApi}',reqBody: {});
    //   if (response.statusCode == 200) {
    //     this.accessToken = response.data['accessToken'];
    //   }
    // }

    static Future<BaseOptions> createDioObject() async {
      return BaseOptions(
        connectTimeout: 12000,
        receiveTimeout: 20000,
      );
    }

    static Future<Dio> _dioClient() async {
      final baseOptions = await createDioObject();
      Dio dio = new Dio(baseOptions)..interceptors.add(ApiInterceptors());
      return dio;
    }

    postAPI(String url, {required Map<String, dynamic> reqBody}) async {
      print("POST API");
      Dio dio = await _dioClient();
      try {
        final response = await dio.post(url, data: reqBody);
        Map<String, dynamic> responseData = json.decode(response.data);
        print("REFRESH RESPONSE 4444 --------> ${response}");
        print("REFRESH RESPONSE--------> ${responseData["data"]["token"]}");

         return response.data;
      } catch (e) {
      }
    }

}
