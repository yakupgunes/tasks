import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolaypara/src/constants/image_strings.dart';
import 'package:kolaypara/src/constants/sizes.dart';
import 'package:kolaypara/src/constants/text_strings.dart';
import '../../controllers/login_controller.dart';
import '../signup/signup_screen.dart';
import 'login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var isObsecure = true.obs;
    final controller = Get.put(LoginController());
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
                    height: size.height * 0.2),
                Text(tLoginTitle,
                    style: Theme.of(context).textTheme.displayLarge),
                Text(tLoginSubTitle,
                    style: Theme.of(context).textTheme.bodyLarge),
                LoginFormWidget(
                    formKey: _formKey,
                    controller: controller,
                    isObsecure: isObsecure),
                const SizedBox(height: tFormHeight - 20),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => Get.to(() => const SignUpScreen()),
                    child: Text.rich(
                      TextSpan(
                          text: tDontHaveAnAccount,
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: const [
                            TextSpan(
                              text: tSignup2,
                              style: TextStyle(color: Colors.blue),
                            ),
                          ]),
                    ),
                  ),
                ),
                //end
              ],
            ),
          ),
        ),
      ),
    );
  }
}
