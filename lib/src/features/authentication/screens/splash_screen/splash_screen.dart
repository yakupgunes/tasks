// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolaypara/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:kolaypara/src/constants/colors.dart';
import 'package:kolaypara/src/constants/image_strings.dart';
import 'package:kolaypara/src/constants/sizes.dart';

import '../../../../common_widgets/fade_in_animation/animation_desing.dart';
import '../../../../constants/text_strings.dart';
import '../../../../common_widgets/fade_in_animation/fade_in_animation_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  //final splashController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();

    return Scaffold(
      backgroundColor: tPrimaryColor,
      body: Stack(
        children: [
          TFadeInAnimation(
            durationInMs: 1600,
            animate: TAnimatePosition(
              topAfter: 0,
              topBefore: -30,
              leftBefore: -30,
              leftAfter: 0,
            ),
            child: Text(""),
          ),
          TFadeInAnimation(
            durationInMs: 2000,
            animate: TAnimatePosition(
              topBefore: 80,
              topAfter: 80,
              leftAfter: tDefaultSize,
              leftBefore: -80,
            ),
            child: Obx(
              () => AnimatedPositioned(
                duration: const Duration(milliseconds: 1600),
                top: 80,
                left: controller.animate.value ? tDefaultSize : -80,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 1600),
                  opacity: controller.animate.value ? 1 : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tAppName,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      Text(
                        tAppTagLine,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          //İLK SAYFANIN GÖRSELİ İÇİN KODLAR
          TFadeInAnimation(
            durationInMs: 2400,
            animate: TAnimatePosition(
                bottomBefore: 0,
                bottomAfter: 100,
                rightAfter: 0,
                rightBefore: 100),
            child: const Image(
              image: AssetImage(tSplashImage),
            ),
          ),
          TFadeInAnimation(
            durationInMs: 2400,
            animate: TAnimatePosition(
              bottomBefore: 0,
              bottomAfter: 60,
              rightBefore: tDefaultSize,
              rightAfter: tDefaultSize,
            ),
            child: Container(
              width: tSplashContainerSize,
              height: tSplashContainerSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: tPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
