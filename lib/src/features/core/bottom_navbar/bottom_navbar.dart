import 'package:flutter/material.dart';
import 'package:kolaypara/src/constants/colors.dart';

import '../../../constants/text_strings.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      backgroundColor: tPrimaryColor,
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: tMenu5,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.emoji_events_outlined),
          label: tMenu1,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event_available),
          label: tMenu4,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.currency_lira),
          label: tMenu2,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contact_support_outlined),
          label: tMenu6,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.support_agent_rounded),
          label: tMenu3,
        ),
      ],
    );
  }
}
