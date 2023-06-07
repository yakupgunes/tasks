import 'package:cloud_firestore/cloud_firestore.dart';
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
    } else {
      String? userId = await getUserIDFromDatabase(email);
      if (userId != null) {
        print('Kullanıcı ID: $userId');
      }
    }
  }

  Future<String?> getUserIDFromDatabase(String userEmail) async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('Email', isEqualTo: userEmail)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        return snapshot.docs.first.id;
      } else {
        throw 'Kullanıcı bulunamadı.';
      }
    } catch (e) {
      print('Kullanıcı ID alınırken bir hata oluştu: $e');
      return null;
    }
  }
}
