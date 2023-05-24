// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  final double minimumAmount = 10000;
  final double availablePoints = 8000;
  final double balance = 100.00;
  final List<String> bankNames = [
    'Banka 1',
    'Banka 2',
    'Banka 3',
    'Banka 4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.red,
              child: Text(
                'Minimum çekim tutarı: ${minimumAmount.toStringAsFixed(2)} puan (${balance.toStringAsFixed(2)} TL)',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Ödeme Talebi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Sahip olduğunuz puan: ${availablePoints.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Bakiye: ${balance.toStringAsFixed(2)} TL',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    '10000 Puan minimum çekim tutarından az olduğundan çekim talebi gerçekleştiremezsiniz.',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'IBAN veya Cüzdan No',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Tutar',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Ödeme Yapılacak İsim',
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Banka/Ödeme Yöntemi',
              ),
              isExpanded: true,
              value: bankNames[0],
              onChanged: (String? newValue) {
                // Dropdown değiştiğinde yapılacak işlemler
              },
              items: bankNames.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Çekim talebi yap butonuna basıldığında yapılacak işlemler
              },
              child: Text('Çekim Talebi Yap'),
            ),
            SizedBox(height: 32),
            Text(
              'Son Çekimler',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text('Henüz çekim yapmadınız.'),
          ],
        ),
      ),
    );
  }
}

class Payment {
  final double amount;
  final String status;

  Payment({
    required this.amount,
    required this.status,
  });
}
