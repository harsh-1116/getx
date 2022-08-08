import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProfileState {
  late TextEditingController nameController;
  late TextEditingController userNameController;
  late TextEditingController dobController;
  late TextEditingController emailController;

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  ProfileState() {
    emailController = TextEditingController(text: kDebugMode ? "" : "");
    nameController = TextEditingController(text: kDebugMode ? "" : "");
    userNameController = TextEditingController(text: kDebugMode ? "" : "");
    dobController = TextEditingController(text: kDebugMode ? "" : "");
  }
}
