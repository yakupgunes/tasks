import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/signup_controller.dart';
import '../../models/user_model.dart';
import '../login/login_screen.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
    required this.formKey,
    required this.controller,
    required this.isObsecure,
  });

  final GlobalKey<FormState> formKey;
  final SignUpController controller;
  final RxBool isObsecure;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              validator: (value) {
                return controller.validateFullName(value!);
              },
              controller: controller.fullName,
              decoration: const InputDecoration(
                label: Text(tFullName),
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.person_outline_rounded,
                  color: tSecondaryColor,
                ),
                labelStyle: TextStyle(color: tSecondaryColor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: tSecondaryColor),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              validator: (value) {
                return controller.validateEmail(value!);
              },
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                label: Text(tEmail),
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: tSecondaryColor,
                ),
                labelStyle: TextStyle(color: tSecondaryColor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: tSecondaryColor),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              validator: (value) {
                return controller.validatePhoneNo(value!);
              },
              controller: controller.phoneNo,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                label: Text(tPhoneNumber),
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.phone_outlined,
                  color: tSecondaryColor,
                ),
                labelStyle: TextStyle(color: tSecondaryColor),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: tSecondaryColor),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),
            Obx(
              () => TextFormField(
                //gerekli yerler doldurulmadığında bile firebase'e boş üyelik ekleniyordu. validator eklenerek önüne geçildi.
                validator: (value) {
                  return controller.validatePassword(value!);
                },
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
                          : Icons.visibility),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    //Email ve şifre kayıt
                    SignUpController.instance.registerUser(
                      controller.email.text.trim(),
                      controller.password.text.trim(),
                    );
                    //Telefon no ile kayıt
                    //SignUpController.instance.phoneAuthentication(
                    //controller.phoneNo.text.trim());
                    //Get.to(() => OTPScreen());
                    final user = UserModel(
                      email: controller.email.text.trim(),
                      password: controller.password.text.trim(),
                      fullName: controller.fullName.text.trim(),
                      phoneNo: controller.phoneNo.text.trim(),
                      completedTasks: "",
                    );
                    SignUpController.instance.createUser(user);
                    //Get.to(() => const OTPScreen());
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
    );
  }
}
