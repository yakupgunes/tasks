import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolaypara/src/constants/text_strings.dart';
import 'package:kolaypara/src/repository/authentication_repository/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  //Textfields'dan veri almak için Textfield Controller
  final email = TextEditingController();
  final password = TextEditingController();

  // Future<void> loginUser(String email, String password) async {
  //   String? error = await AuthenticationRepository.instance
  //       .loginWithEmailAndPassword(email, password);
  //   if (error != null) {
  //     Get.showSnackbar(GetSnackBar(message: error.toString()));
  //   }
  // }
  Future<void> loginUser(String email, String password) async {
    String? error = await AuthenticationRepository.instance
        .loginWithEmailAndPassword(email, password);
    if (error != null) {
      Get.snackbar("Hata", tloginErrorMessage,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
    }
  }
}
