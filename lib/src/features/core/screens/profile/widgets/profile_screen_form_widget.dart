import 'package:flutter/material.dart';
import 'package:kolaypara/src/features/authentication/models/user_model.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/text_strings.dart';

class ProfileScreenFormWidget extends StatelessWidget {
  const ProfileScreenFormWidget({Key? key, required this.userData})
      : super(key: key);

  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          buildProfileInfoRow(tFullName, userData.fullName),
          buildProfileInfoRow(tEmail, userData.email),
          buildProfileInfoRow(tPhoneNumber, userData.phoneNo),
          buildProfileInfoRow(tPassword, userData.password),
        ],
      ),
    );
  }

  Widget buildProfileInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Icon(
            Icons.circle_rounded,
            size: 10,
            color: tSecondaryColor,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
