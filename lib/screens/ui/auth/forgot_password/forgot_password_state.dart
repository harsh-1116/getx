import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ForgotPasswordState{
  TextEditingController textEditingController = TextEditingController();

  var currentText = 0.obs;

  final DateTime dateTime = DateTime.now();

  DateFormat formatter = DateFormat('dd MMM,dd');


}