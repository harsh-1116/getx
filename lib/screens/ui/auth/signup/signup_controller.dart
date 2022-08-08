
import 'package:dream_stock/common/constant/string_constant.dart';
import 'package:dream_stock/screens/ui/auth/signup/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/constant/api_constant.dart';
import '../../../../models/load_status/load_status.dart';
import '../../../../repository/auth_repository.dart';

class SignupController extends GetxController{
  final signUpState = SignUpState();
  
  // final _authRepository = Get.find<AuthRepository>(tag: (AuthRepository).toString());
  
  // void doSignup()async{
  //   if(signUpState.signUpFormKey.currentState!.validate()){
  //     signUpState.signUpStatus.value =  LoadStatus.loading;
  //    EasyLoading.show(
  //      status: StringConstant.loading
  //    );
  //    final result = await _authRepository.doSignUp(
  //        name: signUpState.nameController.text,
  //        user_name: signUpState.userNameController.text,
  //        email: signUpState.emailController.text,
  //        dateOfBirth: signUpState.dobController.text,
  //        password: signUpState.passwordController.text,
  //        profile: signUpState.promoCodeController.text,
  //
  //
  //    );
  //   }
  // }

  // signUp() async {
  //   if (signUpState.signUpKey.currentState!.validate()) {
  //     signUpState.signUpStatus.value = LoadStatus.loading;
  //     EasyLoading.show(status: StringConstant.loading,);
  //     final result = await _authRepository.doSignUp(
  //         // emailId: signUpState.emailController.text,
  //         // password: signUpState.passwordController.text
  //     );
  //     EasyLoading.dismiss();
  //     if (result.code == 1) {
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       prefs.setString(Constants.authToken, result.data!.token.toString());
  //       signUpState.signUpStatus.value = LoadStatus.success;
  //       prefs.setBool(Constants.is_login, true);
  //       Get.offAll(BottomView());
  //     }
  //   }
  // }

}