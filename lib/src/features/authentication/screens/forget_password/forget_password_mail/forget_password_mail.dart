// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolaypara/src/constants/image_strings.dart';
import 'package:kolaypara/src/constants/sizes.dart';
import 'package:kolaypara/src/constants/text_strings.dart';

import '../../../controllers/forget_password_controller.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: tDefaultSize * 2),
                Image(
                  image: AssetImage(tForgetPasswordImage),
                  height: size.height * 0.2,
                ),
                Text(tForgetPassword,
                    style: Theme.of(context).textTheme.headline1),
                Text(tForgetMailSubTitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1),
                SizedBox(height: tFormHeight),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          label: Text(tEmail),
                          hintText: tEmail,
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.mail_outline_rounded),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              onPressed: () {
                                controller.sendPasswordResetEmail(
                                    controller.email.text);
                              },
                              child: Text(tSendMail))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
