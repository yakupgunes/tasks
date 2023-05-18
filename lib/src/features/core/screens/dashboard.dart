// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:kolaypara/src/constants/colors.dart';
import 'package:kolaypara/src/constants/image_strings.dart';
import 'package:kolaypara/src/constants/sizes.dart';
import 'package:kolaypara/src/constants/text_strings.dart';
import '../../../repository/authentication_repository/authentication_repository.dart';
import 'navbar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(tAppName, style: Theme.of(context).textTheme.headline4),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.amber, //Colors.transparent,
          actions: [
            Container(
              margin: EdgeInsets.only(right: 20, top: 7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: tCardBgColor),
              child: IconButton(
                  onPressed: () {
                    //çIKIŞ İŞLEMİ
                    AuthenticationRepository.instance.logout();
                  },
                  icon: const Image(image: AssetImage(tUserProfileImage))),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(tDashboardPadding),
          ),
        ),
        drawer: NavBar(),
      ),
    );
  }
}

//NAVBAR DENENECEK
