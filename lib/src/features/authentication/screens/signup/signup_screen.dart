// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolaypara/src/constants/colors.dart';
import 'package:kolaypara/src/constants/sizes.dart';
import 'package:kolaypara/src/features/authentication/controllers/signup_controller.dart';
import 'package:kolaypara/src/features/authentication/models/user_model.dart';
import 'package:kolaypara/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:kolaypara/src/features/authentication/screens/login/login_screen.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static final GlobalKey<FormState> _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var isObsecure = true.obs;
    final controller = Get.put(SignUpController());
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
                    key: _formKey1,
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
                        Obx(
                          () => TextFormField(
                            controller: controller.password,
                            obscureText: isObsecure.value,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.fingerprint),
                              labelText: tPassword,
                              hintText: tPassword,
                              border: OutlineInputBorder(),
                              suffixIcon: Obx(
                                () => GestureDetector(
                                  onTap: () {
                                    isObsecure.value = !isObsecure.value;
                                  },
                                  child: Icon(isObsecure.value
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: tFormHeight - 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey1.currentState!.validate()) {
                                //Email ve şifre kayıt
                                SignUpController.instance.registerUser(
                                    controller.email.text.trim(),
                                    controller.password.text.trim());
                                //SignUpController.instance.phoneAuthentication(
                                //controller.phoneNo.text.trim());
                                //Get.to(() => OTPScreen());
                                //final user = UserModel(email: controller.email.text.trim(),password: controller.password.text.trim(),fullName: controller.fullName.text.trim(),phoneNo: controller.phoneNo.text.trim(),);
                                //SignUpController.instance.createUser(user);
                                //Get.to(() => OTPScreen());
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
