import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class ProfileScreenFormWidget extends StatelessWidget {
  const ProfileScreenFormWidget({
    super.key,
    required this.fullName,
    required this.email,
    required this.phoneNo,
    required this.password,
  });

  final TextEditingController fullName;
  final TextEditingController email;
  final TextEditingController phoneNo;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            enabled: false,
            controller: fullName,
            //initialValue: userData.fullName,
            decoration: InputDecoration(
              focusColor: Colors.red,
              label: const Text(tFullName),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(100),
              ),
              prefixIcon: const Icon(
                Icons.person_outline_rounded,
                color: tSecondaryColor,
              ),
              labelStyle: const TextStyle(color: tSecondaryColor),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(width: 2, color: tSecondaryColor),
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
              labelStyle: const TextStyle(color: tSecondaryColor),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(width: 2, color: tSecondaryColor),
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
              labelStyle: const TextStyle(color: tSecondaryColor),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(width: 2, color: tSecondaryColor),
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
              labelStyle: const TextStyle(color: tSecondaryColor),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(width: 2, color: tSecondaryColor),
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
        ],
      ),
    );
  }
}
