// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

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
              'Ne gibi görevler yapabilirim?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Google Play, AppStore, Google Maps, Youtube, Instagram, Facebook, Web Sitesi gibi platformlarda ziyaret, izleme, yorum yazma gibi basit görevleri yapabilirsiniz.',
            ),
          ],
        ),
      ),
    );
  }
}
