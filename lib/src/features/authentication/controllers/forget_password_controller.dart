// ignore_for_file: invalid_return_type_for_catch_error

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolaypara/src/features/authentication/screens/login/login_screen.dart';

import '../../../constants/text_strings.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();

  void sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email).then((value) {
      Get.offAll(const LoginScreen());
      Get.snackbar(tForgetMailSubTitle, tSendingMailSuccess);
    }).catchError(
        (onError) => Get.snackbar(tErrorSendingEmail, tErrorSendingEmail2));
  }
}
