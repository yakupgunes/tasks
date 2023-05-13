// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolaypara/src/constants/colors.dart';
import 'package:kolaypara/src/constants/sizes.dart';
import 'package:kolaypara/src/features/authentication/controllers/signup_controller.dart';
import 'package:kolaypara/src/features/authentication/screens/login/login_screen.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(tWelcomeScreenImage),
                  height: size.height * 0.2,
                ),
                Text(tSignUpTitle,
                    style: Theme.of(context).textTheme.displayLarge),
                Text(tSignUpSubTitle,
                    style: Theme.of(context).textTheme.bodyLarge),
                Container(
                  padding: EdgeInsets.symmetric(vertical: tFormHeight - 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: controller.fullName,
                          decoration: InputDecoration(
                            label: Text(tFullName),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.person_outline_rounded,
                              color: tSecondaryColor,
                            ),
                            labelStyle: TextStyle(color: tSecondaryColor),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: tSecondaryColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: tFormHeight - 20,
                        ),
                        TextFormField(
                          controller: controller.email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            label: Text(tEmail),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: tSecondaryColor,
                            ),
                            labelStyle: TextStyle(color: tSecondaryColor),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: tSecondaryColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: tFormHeight - 20,
                        ),
                        TextFormField(
                          controller: controller.phoneNo,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Text(tPhoneNumber),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.numbers,
                              color: tSecondaryColor,
                            ),
                            labelStyle: TextStyle(color: tSecondaryColor),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: tSecondaryColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: tFormHeight - 20,
                        ),
                        TextFormField(
                          controller: controller.password,
                          obscureText: true,
                          decoration: InputDecoration(
                            label: Text(tPassword),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(
                              Icons.fingerprint,
                              color: tSecondaryColor,
                            ),
                            labelStyle: TextStyle(color: tSecondaryColor),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: tSecondaryColor),
                            ),
                          ),
                        ),
                        SizedBox(height: tFormHeight - 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                SignUpController.instance.registerUser(
                                    controller.email.text.trim(),
                                    controller.password.text.trim());
                              }
                            },
                            child: Text(tSignup.toUpperCase()),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () => Get.to(() => const LoginScreen()),
                            child: Text.rich(
                              TextSpan(
                                text: tAlreadyHaveAnAccount,
                                style: Theme.of(context).textTheme.bodyLarge,
                                children: const [
                                  TextSpan(
                                    text: tLogin2,
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
