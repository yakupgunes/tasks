// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kolaypara/src/constants/colors.dart';
import 'package:kolaypara/src/constants/image_strings.dart';
import 'package:kolaypara/src/constants/sizes.dart';
import 'package:kolaypara/src/constants/text_strings.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../profile/update_profile_screen.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    //Variables
    final txtTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu, color: Colors.black),
          ),
          title: Text(tAppName, style: Theme.of(context).textTheme.headline4),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              margin: EdgeInsets.only(right: 20, top: 7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: tCardBgColor),
              child: IconButton(
                  onPressed: () => Get.to(
                      () => const UpdateProfileScreen()), //ProfileScreen()),
                  icon: const Image(image: AssetImage(tUserProfileImage))),
            ),
            Container(
              margin: EdgeInsets.only(right: 20, top: 7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: tCardBgColor),
              child: IconButton(
                  onPressed: () {
                    //çIKIŞ İŞLEMİ
                    AuthenticationRepository.instance.logout();
                  },
                  icon: Icon(Icons.exit_to_app, color: Colors.red)),
            ),
          ],
        ),
        body: SingleChildScrollView(
          //padding: EdgeInsets.all(tDashboardPadding),
          child: Container(
            padding: EdgeInsets.all(tDashboardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Baştaki yazılar
                Center(
                  child: Text(
                    tDashboardWelcome1,
                    style: GoogleFonts.bebasNeue(
                        fontSize: 28, color: Colors.black),
                    // letterSpacing: 1,
                    // color: Colors.red,
                    // fontSize: 15,
                    // fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 50),

                /// -- TOPLAM BAKİYE
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: tDarkColor),
                        child: Center(
                          child: Icon(LineAwesomeIcons.turkish_lira_sign,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 15),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                tDashboard1,
                              ),
                            ),
                            //SizedBox(height: 5),
                            Expanded(
                                child: Text(tDashboard2,
                                    style: txtTheme.headline4)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: tDashboardPadding + 20),

                // -- TAMAMLANAN GÖREVLER
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: tDarkColor),
                        child: Center(
                          child: Icon(LineAwesomeIcons.check_square,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 15),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                tDashboard3,
                              ),
                            ),
                            //SizedBox(height: 5),
                            Expanded(
                                child: Text(tDashboard4,
                                    style: txtTheme.headline4)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: tDashboardPadding + 20),

                // -- ONAY BEKLEYEN GÖREVLER
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: tDarkColor),
                        child: Center(
                          child: Icon(Icons.autorenew, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 15),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                tDashboard5,
                              ),
                            ),
                            //SizedBox(height: 5),
                            Expanded(
                                child: Text(tDashboard6,
                                    style: txtTheme.headline4)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SingleChildScrollView(
          child: Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: GNav(
                duration: Duration(milliseconds: 100),
                curve: Curves.ease,
                backgroundColor: Colors.blue,
                color: Colors.white,
                activeColor: Colors.pink,
                tabBackgroundColor: Colors.white,
                padding: EdgeInsets.all(20),
                tabs: const [
                  GButton(
                    icon: Icons.home,
                  ),
                  GButton(
                    icon: Icons.emoji_events_outlined,
                  ),
                  GButton(
                      icon: Icons
                          .event_available), //task, done_outline, task alt, check
                  GButton(
                    icon: Icons.currency_lira,
                  ),
                  GButton(
                    icon: Icons.support_agent_rounded,
                  ),
                  GButton(
                    icon: Icons.contact_support,
                  ),
                ],
              ),
            ),
          ),
        ),
        //drawer: NavBar(),
      ),
    );
  }
}
