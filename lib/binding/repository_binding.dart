import 'package:dream_stock/api_service/api_utils.dart';
import 'package:dream_stock/api_service/rest_client.dart';
import 'package:dream_stock/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class RepositoryBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
            () => AuthRepositoryImpl());
    //Get.put(AuthRepository());
  }
  }

