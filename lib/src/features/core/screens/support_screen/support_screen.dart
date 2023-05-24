// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  List<SupportTicket> supportTickets = [];

  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  @override
  void dispose() {
    subjectController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void submitSupportTicket() {
    String subject = subjectController.text;
    String message = messageController.text;

    SupportTicket ticket = SupportTicket(subject: subject, message: message);
    supportTickets.add(ticket);

    subjectController.clear();
    messageController.clear();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Destek Talebi',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: subjectController,
              decoration: InputDecoration(
                labelText: 'Konu',
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: messageController,
              decoration: InputDecoration(
                labelText: 'Mesaj',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                submitSupportTicket();
              },
              child: Text('Destek Talebi Gönder'),
            ),
            SizedBox(height: 32),
            Text(
              'Destek Talepleri',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            supportTickets.isEmpty
                ? Text('Henüz destek talebi gönderilmedi.')
                : Column(
                    children: supportTickets
                        .map((ticket) => Container(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Konu: ${ticket.subject}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text('Mesaj: ${ticket.message}'),
                                  Divider(),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
          ],
        ),
      ),
    );
  }
}

class SupportTicket {
  final String subject;
  final String message;

  SupportTicket({required this.subject, required this.message});
}
