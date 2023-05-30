// ignore_for_file: deprecated_member_use, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kolaypara/src/features/core/deneme_tasks_screen/deneme_tasks_screen.dart';
import 'package:kolaypara/src/features/core/screens/dashboard_screen/dashboard_screen.dart';
import 'package:kolaypara/src/features/core/screens/new_tasks_screen/new_tasks_screen.dart';
import 'package:kolaypara/src/features/core/screens/task_screen/task_screen.dart';
import 'package:kolaypara/src/features/core/screens/faq_screen/faq_screen.dart';
import 'package:kolaypara/src/features/core/screens/payment_screen/payment_screen.dart';
import 'package:kolaypara/src/features/core/screens/support_screen/support_screen.dart';
import 'package:kolaypara/src/repository/authentication_repository/authentication_repository.dart';
import '../../../constants/colors.dart';
import '../../../constants/text_strings.dart';
import '../bottom_navbar/bottom_navbar.dart';
import '../screens/profile/profile_screen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Container(
            margin: const EdgeInsets.only(),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: tCardBgColor),
            child: IconButton(
              onPressed: () =>
                  Get.to(() => const UpdateProfileScreen()), //ProfileScreen()),
              icon: const Icon(Icons.person, color: Colors.black, size: 30),
            ), //const Image(image: AssetImage(tUserProfileImage))),
          ),
          //title: Text(tAppName, style: Theme.of(context).textTheme.headline4),
          title: Text(_getNavbarTitle(),
              style: Theme.of(context).textTheme.headline4),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20, top: 7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: tCardBgColor),
              child: IconButton(
                  onPressed: () {
                    //çIKIŞ İŞLEMİ
                    AuthenticationRepository.instance.logout();
                  },
                  icon: const Icon(
                    Icons.exit_to_app,
                    color: Colors.black,
                    size: 30,
                  )),
            ),
          ],
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: [
            DashboardScreen(),
            TaskListScreen(), //NewTasksScreen(),
            TaskScreen(),
            PaymentScreen(),
            SupportScreen(),
            FaqScreen(),

            // Diğer sayfa içeriklerini ekleyin
          ],
        ),
        bottomNavigationBar: BottomNavBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  String _getNavbarTitle() {
    if (_currentIndex == 0) {
      return tMenu5;
    } else if (_currentIndex == 1) {
      return tMenu1;
    } else if (_currentIndex == 2) {
      return tMenu4;
    } else if (_currentIndex == 3) {
      return tMenu2;
    } else if (_currentIndex == 4) {
      return tMenu6;
    } else if (_currentIndex == 5) {
      return tMenu3;
    }
    // Diğer durumlar için başlıkları buraya ekleyin
    return '';
  }
}
