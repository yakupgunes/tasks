// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolaypara/src/constants/colors.dart';
import 'package:kolaypara/src/constants/sizes.dart';
import 'package:kolaypara/src/constants/text_strings.dart';
import 'package:kolaypara/src/features/authentication/controllers/profile_controller.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../constants/image_strings.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../../../authentication/models/user_model.dart';
import 'widgets/profile_menu.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: tPrimaryColor,
          centerTitle: true,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(LineAwesomeIcons.angle_left)),
          title: Text(tProfile, style: Theme.of(context).textTheme.headline4),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),

            /// -- Future Builder to load cloud data
            child: FutureBuilder(
              future: controller.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    UserModel userData = snapshot.data as UserModel;

                    ///Controllers
                    final id = TextEditingController(text: userData.id);
                    final email = TextEditingController(text: userData.email);
                    final password =
                        TextEditingController(text: userData.password);
                    final fullName =
                        TextEditingController(text: userData.fullName);
                    final phoneNo =
                        TextEditingController(text: userData.phoneNo);
                    return Column(
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: const Image(
                                      image: AssetImage(tProfileImage))),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                        Form(
                          child: Column(
                            children: [
                              TextFormField(
                                enabled: false,
                                controller: fullName,
                                //initialValue: userData.fullName,
                                decoration: InputDecoration(
                                  focusColor: Colors.red,
                                  label: Text(tFullName),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.person_outline_rounded,
                                    color: tSecondaryColor,
                                  ),
                                  labelStyle: TextStyle(color: tSecondaryColor),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                        width: 2, color: tSecondaryColor),
                                  ),
                                ),
                              ),
                              const SizedBox(height: tFormHeight - 20),
                              TextFormField(
                                enabled: false,
                                controller: email,
                                //initialValue: userData.email,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  label: const Text(tEmail),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.email_outlined,
                                    color: tSecondaryColor,
                                  ),
                                  labelStyle:
                                      const TextStyle(color: tSecondaryColor),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                        width: 2, color: tSecondaryColor),
                                  ),
                                ),
                              ),
                              const SizedBox(height: tFormHeight - 20),
                              TextFormField(
                                enabled: false,
                                controller: phoneNo,
                                //initialValue: userData.phoneNo,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  label: const Text(tPhoneNumber),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.phone_outlined,
                                    color: tSecondaryColor,
                                  ),
                                  labelStyle:
                                      const TextStyle(color: tSecondaryColor),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                        width: 2, color: tSecondaryColor),
                                  ),
                                ),
                              ),
                              const SizedBox(height: tFormHeight - 20),
                              TextFormField(
                                enabled: false,
                                controller: password,
                                //initialValue: userData.password,
                                decoration: InputDecoration(
                                  label: const Text(tPassword),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.fingerprint,
                                    color: tSecondaryColor,
                                  ),
                                  labelStyle: TextStyle(color: tSecondaryColor),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                    borderSide: BorderSide(
                                        width: 2, color: tSecondaryColor),
                                  ),
                                ),
                              ),
                              const SizedBox(height: tFormHeight),

                              /*///Form Submit Button
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    final userData = UserModel(
                                      id: id.text,
                                      email: email.text.trim(),
                                      password: password.text.trim(),
                                      fullName: fullName.text.trim(),
                                      phoneNo: phoneNo.text.trim(),
                                    );

                                    await controller.updateRecord(userData);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: tPrimaryColor,
                                      side: BorderSide.none,
                                      shape: const StadiumBorder()),
                                  child: const Text(tEditProfile,
                                      style: TextStyle(color: tDarkColor)),
                                ),
                              ),*/
                              const SizedBox(height: 150),
                              ProfileMenuWidget(
                                title: "Çıkış",
                                icon: LineAwesomeIcons.alternate_sign_out,
                                textColor: Colors.red,
                                endIcon: false,
                                onPress: () {
                                  AuthenticationRepository.instance.logout();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return const Center(child: Text("Bir şeyler yanlış gitti"));
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
