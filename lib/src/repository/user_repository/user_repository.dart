// ignore_for_file: avoid_print, invalid_return_type_for_catch_error, body_might_complete_normally_catch_error

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolaypara/src/constants/text_strings.dart';
import 'package:kolaypara/src/features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Store user in FireStore
  /*Future<void> createUser(UserModel user) async {
    await _db.collection("Users").add(user.tojson()).whenComplete(() {
      Get.snackbar(
        tcreateUser1,
        tcreateUser2,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
    }).catchError((error, stackTrace) {
      Get.snackbar(tcreateUser3, tcreateUser4,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print("HATA- $error" /*error.toString()*/);
    });
  }*/

  /// --CREATEUSER DEĞİŞTİRLECEK
  Future<void> createUser(UserModel user) async {
    final existingUserSnapshot = await _db
        .collection("Users")
        .where("Email", isEqualTo: user.email)
        .get();

    if (existingUserSnapshot.docs.isEmpty) {
      await _db.collection("Users").add(user.tojson()).whenComplete(() {
        Get.snackbar(
          tcreateUser1,
          tcreateUser2,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green,
        );
      }).catchError((error, stackTrace) {
        Get.snackbar(tcreateUser3, tcreateUser4,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red);
        print("HATA- $error");
      });
    } else {
      // E-posta zaten kullanılıyor
      Get.snackbar("Hata", "Bu e-posta zaten kullanılıyor.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
    }
  }

  /// Fetch all user or user details
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection("Users").doc(user.id).update(user.tojson());
  }
}
