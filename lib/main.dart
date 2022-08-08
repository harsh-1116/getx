import 'dart:async';

import 'package:dream_stock/binding/initial_binding.dart';
import 'package:dream_stock/common/constant/color_constant.dart';
import 'package:dream_stock/common/constant/font_constant.dart';
import 'package:dream_stock/screens/ui/splash_screen/splash_screen_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'api_service/rest_client.dart';

void main(main){
  WidgetsFlutterBinding.ensureInitialized();
  initServices();
  runApp(const MyApp());
  configLoading();
}

initServices() async {
  await Get.putAsync<RestClient>(() => RestClient().init());
  // await Get.putAsync<AppDb>(() => AppDb.init());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // systemOverlayStyle: SystemUiOverlayStyle.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: ColorConstant.blackColor,
      systemNavigationBarDividerColor: ColorConstant.greyBackground,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return  GetMaterialApp(



        theme: ThemeData(
          textTheme: const TextTheme(
            subtitle1: TextStyle(
              fontSize: 14,
              fontWeight: FontWeightConstant.regular,
            )

          ),
        primaryColor: ColorConstant.selectedLightGreen,
        colorScheme: const ColorScheme.highContrastLight(
          primary: ColorConstant.selectedLightGreen
        ),
        canvasColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        focusColor: ColorConstant.whiteColor,
      ),
        debugShowCheckedModeBanner: false,


      home: const SplashScreen(),
      builder: EasyLoading.init(),
      initialBinding: InitialBinding(),
      // initialRoute: RouteConfig.splash,
      // getPages: RouteConfig.getPages,
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 3000)
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = ColorConstant.whiteColor
    ..backgroundColor = ColorConstant.selectedLightGreen
    ..indicatorColor = ColorConstant.whiteColor
    ..textColor = ColorConstant.whiteColor
    ..maskColor = Colors.deepOrange.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = true;
}





