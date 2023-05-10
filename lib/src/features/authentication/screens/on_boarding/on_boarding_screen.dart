import 'package:flutter/material.dart';
import 'package:kolaypara/src/constants/colors.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            pages: [
              Container(color: tOnBoardingPage1Color),
              Container(color: tOnBoardingPage2Color),
              Container(color: tOnBoardingPage3Color),
            ],
          ),
        ],
      ),
    );
  }
}
