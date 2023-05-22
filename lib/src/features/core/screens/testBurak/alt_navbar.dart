import 'package:flutter/material.dart';

class AltNavbar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AltNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Ana Sayfa',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Ayarlar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Görevler',
        ),
        // Diğer butonlar için gerekli BottomNavigationBarItem'ları ekleyin
      ],
    );
  }
}
