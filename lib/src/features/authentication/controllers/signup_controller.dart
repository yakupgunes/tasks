import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolaypara/src/features/authentication/models/user_model.dart';
import 'package:kolaypara/src/repository/authentication_repository/authentication_repository.dart';
import 'package:kolaypara/src/repository/user_repository/user_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextFiedl Controller to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final userRepo = Get.put(UserRepository());

  Future<void> registerUser(String email, String password) async {
    String? error = await AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
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
      return "Ad Soyad bölümü boş bırakılamaz.";
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "E-posta bölümü boş bırakılamaz.";
    }
    return null;
  }

  String? validatePhoneNo(String value) {
    if (value.isEmpty) {
      return "Telefon numarası boş bırakılamaz.";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return "Şifre bölümü boş bırakılamaz.";
    }
    return null;
  }
}
