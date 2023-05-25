// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolaypara/src/constants/sizes.dart';
import 'package:kolaypara/src/constants/text_strings.dart';
import 'package:kolaypara/src/features/authentication/controllers/profile_controller.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../constants/image_strings.dart';
import '../../../authentication/models/user_model.dart';
import 'widgets/profile_screen_form_widget.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(LineAwesomeIcons.angle_left),
              color: Colors.black),
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
                    //final id = TextEditingController(text: userData.id);
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
                        ProfileScreenFormWidget(
                            fullName: fullName,
                            email: email,
                            phoneNo: phoneNo,
                            password: password),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return const Center(
                        child: Text(tProfileScreenErrorMessage));
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
