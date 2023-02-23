import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ujikom_app/app/modules/dashboard/views/dashboard_view.dart';

import '../../../utils/api.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final _getConnect = GetConnect();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final authToken = GetStorage();

  // final count = 0.obs;
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
    //fungsi _loginNow() dengan deklarasi kata kunci async
    final response = await _getConnect.post(BaseUrl.auth, {
      //membuat variabel response yang dideklarasikan dengan kata kunci final, menggunakan fungsi _getConnect.post() untuk melakukan permintaan HTTP POST ke endpoint yang diberikan dalam konstanta BaseUrl.auth, dan mengirimkan email dan password yang dimasukkan pengguna dalam teks emailController dan passwordController. Respons HTTP disimpan dalam variabel response.
      'email': emailController.text, //mengirim email dari input emailController
      'password': passwordController
          .text, //mengirim password dari input passwordController
    });

    if (response.body['success'] == true) {
      //struktur if-else untuk menentukan tindakan yang harus diambil berdasarkan respons yang diterima dari permintaan HTTP. Jika nilai kunci success dalam response.body adalah true, maka aplikasi menulis token akses yang diperoleh dari respons ke penyimpanan lokal menggunakan authToken.write().
      authToken.write('token', response.body['access_token']);

      Get.offAll(() =>
          const DashboardView()); //menyimpan token akses ke penyimpanan lokal dengan menggunakan authToken.write()
    } else {
      //Jika tidak, aplikasi menampilkan pesan kesalahan menggunakan Get.snackbar()
      Get.snackbar(
        'Error', //parameter pesan yang ditampilkan dalam snackbar
        response.body['message']
            .toString(), //mengambil pesan kesalahan dari nilai kunci message dalam response.body
        icon: const Icon(Icons.error), //ikon yang ditampilkan pada snackbar
        backgroundColor: Colors.red, //warna latar belakang snackbar
        colorText: Colors.white, //warna teks pada snackbar
        forwardAnimationCurve: Curves.bounceIn, //kurva animasi pada snackbar
        margin: const EdgeInsets.only(
          //mengatur margin pada snackbar
          top: 10,
          left: 5,
          right: 5,
        ),
      );
    }
  }

  // void increment() => count.value++;
}
