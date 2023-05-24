import 'package:flutter/material.dart';

import 'section_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SectionWidget(
              title: 'Toplam Bakiye ve Puan',
              value: '250 TL - 0 Puan',
              color: Colors.black,
            ),
            SizedBox(height: 20),
            SectionWidget(
              title: 'Tamamlanan Görevler',
              value: '5 Görev Tamamlandı',
              color: Colors.black,
            ),
            SizedBox(height: 20),
            SectionWidget(
              title: 'Onay Bekleyen Görevler',
              value: '2 Görev Bekliyor',
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
