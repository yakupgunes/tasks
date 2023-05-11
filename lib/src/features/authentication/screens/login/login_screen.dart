// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:kolaypara/src/constants/image_strings.dart';
import 'package:kolaypara/src/constants/sizes.dart';
import 'package:kolaypara/src/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                Text(tLoginTitle,
                    style: Theme.of(context).textTheme.displayLarge),
                Text(tLoginSubTitle,
                    style: Theme.of(context).textTheme.bodyLarge),
                Form(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: tFormHeight - 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person_outline_outlined),
                            labelText: tEmail,
                            hintText: tEmail,
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: tFormHeight - 20),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.fingerprint),
                            labelText: tPassword,
                            hintText: tPassword,
                            border: OutlineInputBorder(),
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.remove_red_eye_sharp)),
                          ),
                        ),
                        const SizedBox(height: tFormHeight - 20),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(tForgetPassword),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {},
                              child: Text(tLogin.toUpperCase())),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: tFormHeight - 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {},
                    child: Text.rich(
                      TextSpan(
                          text: tDontHaveAnAccount,
                          style: Theme.of(context).textTheme.bodyLarge,
                          children: const [
                            TextSpan(
                              text: tSignup2,
                              style: TextStyle(
                                color: Colors.blue,
                              ),
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
