// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kolaypara/src/constants/text_strings.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              tFaqScreenTitle,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              tFaqScreenValue,
            ),
          ],
        ),
      ),
    );
  }
}
