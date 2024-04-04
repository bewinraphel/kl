import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/api/api_call.dart';

class ApiController extends GetxController {
  final ApicallLogin authService = ApicallLogin();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var isLoading = false.obs;

  void login() async {
    isLoading.value = true;
    final username = usernameController.text;
    final password = passwordController.text;

    try {
      final isAuthenticated = await authService.login(username, password);
      if (isAuthenticated) {
        Get.snackbar('Success', 'Login Successful');
        Get.toNamed('/home');
      } else {
        Get.snackbar('Error', 'Invalid credentials');
      }
    } finally {
      isLoading.value = false;
    }
  }
}
