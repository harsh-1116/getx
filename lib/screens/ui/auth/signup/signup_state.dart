import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/load_status/load_status.dart';

class SignUpState{
TextEditingController nameController = TextEditingController();
TextEditingController userNameController = TextEditingController();
TextEditingController dobController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();
TextEditingController promoCodeController = TextEditingController();

final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

final signUpStatus = LoadStatus.initial.obs;
}