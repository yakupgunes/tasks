import 'package:flutter/material.dart';
import 'alt_navbar.dart';
import 'anasayfa_icerik.dart';
import 'ayarlar_icerik.dart';
import 'gorevler_icerik.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getNavbarTitle()),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          AnaSayfaIcerik(),
          AyarlarIcerik(),
          GorevlerIcerik(),

          // Diğer sayfa içeriklerini ekleyin
        ],
      ),
      bottomNavigationBar: AltNavbar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  String _getNavbarTitle() {
    if (_currentIndex == 0) {
      return 'Ana Sayfa';
    } else if (_currentIndex == 1) {
      return 'Ayarlar';
    } else if (_currentIndex == 2) {
      return 'Görevler';
    } else if (_currentIndex == 3) {
      return 'Diğer Sayfa';
    }
    // Diğer durumlar için başlıkları buraya ekleyin
    return '';
  }
}
