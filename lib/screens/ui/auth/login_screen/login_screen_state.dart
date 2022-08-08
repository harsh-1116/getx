import 'package:dream_stock/models/login_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../models/load_status/load_status.dart';

class LoginState{

  final DateTime dateTime = DateTime.now();
  DateFormat formatter = DateFormat('dd MMM,dd');

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController forgotEmailController;

   final loginEntity = LoginEntity().obs;

   final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
   final loginStatus = LoadStatus.initial.obs;

LoginState(){

 emailController = TextEditingController(text: kDebugMode ? "harsh216@gmail.com" : "");
 passwordController = TextEditingController(text: kDebugMode ? "Test@123":"");



}

}