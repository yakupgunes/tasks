// ignore_for_file: unused_local_variable, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:kolaypara/src/constants/colors.dart';
import 'package:kolaypara/src/constants/text_strings.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = const EdgeInsets.symmetric(horizontal: 20);
    return Drawer(
      surfaceTintColor: Colors.black,
      child: Material(
        color: Colors.blue,
        child: ListView(
          padding: padding,
          children: [
            const SizedBox(height: 48),
            buildMenuItem(
              text: tMenu5,
              icon: Icons.home_outlined,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: tMenu1,
              icon: Icons.add_task,
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: tMenu4,
              icon: Icons.task_alt,
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: tMenu2,
              icon: Icons.attach_money,
            ),
            const SizedBox(height: 16),
            buildMenuItem(
              text: tMenu3,
              icon: Icons.question_mark,
            ),
            const SizedBox(height: 24),
            const Divider(color: Colors.white),
            const SizedBox(height: 24),
            buildMenuItem(
              text: "random yazı",
              icon: Icons.question_mark,
            ),
          ],
        ),
      ),
    );
  }

  buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = tPrimaryColor;
    final hoverColor = Colors.blue;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {}
}
