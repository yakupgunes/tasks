import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/login_controller.dart';
import '../forget_password/forget_password_options/forget_password_model_bottom_sheet.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.controller,
    required this.isObsecure,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final LoginController controller;
  final RxBool isObsecure;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: tEmail,
                  hintText: tEmail,
                  border: OutlineInputBorder()),
            ),
            const SizedBox(height: tFormHeight - 20),
            Obx(
              () => TextFormField(
                controller: controller.password,
                obscureText: isObsecure.value,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.fingerprint),
                  labelText: tPassword,
                  hintText: tPassword,
                  border: const OutlineInputBorder(),
                  suffixIcon: Obx(
                    () => GestureDetector(
                        onTap: () {
                          isObsecure.value = !isObsecure.value;
                        },
                        child: Icon(isObsecure.value
                            ? Icons.visibility_off
                            : Icons.visibility)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),

            //--FORGET PW BUTTON
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    ForgetPasswordScreen.buildShowModalBottomSheet(context);
                  },
                  child: const Text(tForgetPassword)),
            ),

            //--LOGİN BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    //Get.to(Dashboard()); // diğer sayfaların işlemlerine kadar sayfalara direkt geçiş yapıldı
                    if (_formKey.currentState!.validate()) {
                      LoginController.instance.loginUser(
                          controller.email.text.trim(),
                          controller.password.text.trim());
                    }
                  },
                  child: Text(tLogin.toUpperCase())),
            ),
          ],
        ),
      ),
    );
  }
}
