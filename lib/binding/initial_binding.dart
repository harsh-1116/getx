import 'package:dream_stock/api_service/rest_client.dart';
import 'package:dream_stock/binding/repository_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings{
  final apiClient = RestClient().init();
  @override
  void dependencies() {
    RepositoryBinding().dependencies();
  }
}