import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolaypara/src/constants/text_strings.dart';
import 'package:kolaypara/src/features/authentication/models/user_model.dart';
import 'package:kolaypara/src/repository/authentication_repository/authentication_repository.dart';
import 'package:kolaypara/src/repository/user_repository/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controller to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());

  /*Future<void> registerUser(String email, String password) async {
    String? error = await AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }*/

  //-- İLK REGİSTERUSER DEĞİŞTİRME DENEMESİ

  /* Future<void> registerUser(String email, String password) async {
  String? error = await AuthenticationRepository.instance
      .createUserWithEmailAndPassword(email, password);
  if (error != null) {
    Get.showSnackbar(GetSnackBar(message: error.toString()));
  } else {
    final user = UserModel(
      email: email.trim(),
      password: password.trim(),
      fullName: controller.fullName.text.trim(),
      phoneNo: controller.phoneNo.text.trim(),
    );
    SignUpController.instance.createUser(user);
  }
}
*/

  /// ----------REGİSTERUSER DEĞİŞTİRİLECEK----------

  final fullNameController = TextEditingController();
  final phoneNoController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

// ...

  Future<void> registerUser(String email, String password) async {
    String? error = await AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    } else {
      final user = UserModel(
        email: email.trim(),
        password: password.trim(),
        fullName: fullNameController.text.trim(),
        phoneNo: phoneNoController.text.trim(),
        //completedTasks: [],
      );
      SignUpController.instance.createUser(user);
    }
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    //phoneAuthentication(user.phoneNo);
    //Get.to(() => const OTPScreen());
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

  String? validateFullName(String value) {
    if (value.isEmpty) {
      return tvalidateFullName;
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return tvalidateEmail;
    }
    return null;
  }

  String? validatePhoneNo(String value) {
    if (value.isEmpty) {
      return tvalidatePhoneNo;
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return tvalidatePassword;
    }
    return null;
  }
}
