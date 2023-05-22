import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AnaSayfa(),
    );
  }
}

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

  String _getNavbarTitle() {
    if (_currentIndex == 0) {
      return 'Ana Sayfa';
    } else if (_currentIndex == 1) {
      return 'Ayarlar';
    } else if (_currentIndex == 2) {
      return 'Diğer Sayfa';
    }
    // Diğer durumlar için başlıkları buraya ekleyin
    return '';
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
          // Ana Sayfa İçeriği
          Center(
            child: Text('Ana Sayfa İçeriği'),
          ),
          // Ayarlar İçeriği
          Center(
            child: Text('Ayarlar İçeriği'),
          ),
          Center(
            child: Text('Görevler İçeriği'),
          ),
          // Diğer sayfa içeriklerini ekle
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
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
          // Diğer butonlar için gerekli BottomNavigationBarItem'ları ekle
        ],
      ),
    );
  }
}
