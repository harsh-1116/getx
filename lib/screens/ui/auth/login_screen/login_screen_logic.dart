import 'package:dream_stock/common/constant/api_constant.dart';
import 'package:dream_stock/common/constant/string_constant.dart';
import 'package:dream_stock/models/load_status/load_status.dart';
import 'package:dream_stock/repository/auth_repository.dart';
import 'package:dream_stock/screens/ui/bottom_navigation/bottom_navigation_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen_state.dart';

class LoginController extends GetxController {
  final loginState = LoginState();
  final _authRepository = Get.find<AuthRepository>();

  void doSignIn() async {
    if (loginState.loginFormKey.currentState!.validate()) {
      loginState.loginStatus.value = LoadStatus.loading;
      EasyLoading.show(
        status: StringConstant.loading,
      );
      try {
        var jsonBody = {
          "email": loginState.emailController.text.trim().toLowerCase(),
          "password": loginState.passwordController.text.trim()
        };
        // final result = await _authRepository.doLogin(reqBody: jsonBody);
        Map<String, dynamic> result = await _authRepository.doLogin(
            emailId: loginState.emailController.text.trim().toLowerCase(),
            password: loginState.passwordController.text.trim());

        EasyLoading.dismiss();
        loginState.loginStatus.value = LoadStatus.success;

        if (result != null && result['code'] == 1 && result['code'] != null) {
          print("result code------>>>>${result['code']}");
          SharedPreferences prefs = await SharedPreferences.getInstance();
          Get.to(()=>BottomNavigationScreen());

          /*prefs.setString(Constants.auth_token, result.data!.token!.toString());
          prefs.setBool(Constants.is_login, true);*/
        }

        print("response ------->$result");
      } catch (e) {
        print("error in login---->>>>$e");
        loginState.loginStatus.value = LoadStatus.failure;
      }
    }
  }


}
