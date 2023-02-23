import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ujikom_app/app/modules/dashboard/views/dashboard_view.dart';

import '../../../utils/api.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final authToken = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginNow() async {
    try {
      final response = await http.post(Uri.parse(BaseUrl.auth), body: {
        'email': emailController.text,
        'password': passwordController.text,
      });
      final data = json.decode(response.body);

      if (response.statusCode == 200 && data['success'] == true) {
        authToken.write('token', data['access_token']);
        Get.offAll(() => const DashboardView());
      } else {
        Get.snackbar(
          'Error',
          data['message'].toString(),
          icon: const Icon(Icons.error),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          forwardAnimationCurve: Curves.bounceIn,
          margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
        );
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error',
        'Something went wrong',
        icon: const Icon(Icons.error),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        forwardAnimationCurve: Curves.bounceIn,
        margin: const EdgeInsets.only(top: 10, left: 5, right: 5),
      );
    }
  }
}
