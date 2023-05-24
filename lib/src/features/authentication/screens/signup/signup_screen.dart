import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolaypara/src/constants/sizes.dart';
import 'package:kolaypara/src/features/authentication/controllers/signup_controller.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';
import 'signup_form_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
                  image: const AssetImage(tWelcomeScreenImage),
                  height: size.height * 0.2,
                ),
                Text(tSignUpTitle,
                    style: Theme.of(context).textTheme.displayLarge),
                Text(tSignUpSubTitle,
                    style: Theme.of(context).textTheme.bodyLarge),
                SignUpFormWidget(
                    formKey: formKey,
                    controller: controller,
                    isObsecure: isObsecure),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
