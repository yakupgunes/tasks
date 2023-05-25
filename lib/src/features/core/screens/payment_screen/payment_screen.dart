// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kolaypara/src/constants/text_strings.dart';

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
              tPaymentScreen1,
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
                    tPaymentScreen2,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold, //
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: tPaymentScreen3,
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: tPaymentScreen4,
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: tPaymentScreen5,
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: tPaymentScreen6,
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
              child: Text(tPaymentScreen7),
            ),
            SizedBox(height: 32),
            Text(
              tPaymentScreen8,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(tPaymentScreen9),
          ],
        ),
      ),
    );
  }
}
