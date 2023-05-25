// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:kolaypara/src/constants/text_strings.dart';
import 'support_screen_class.dart';

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
              tSupportScreen1,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: subjectController,
              decoration: InputDecoration(
                labelText: tSupportScreen2,
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: messageController,
              decoration: InputDecoration(
                labelText: tSupportScreen3,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                submitSupportTicket();
              },
              child: Text(tSupportScreen4),
            ),
            SizedBox(height: 32),
            Text(
              tSupportScreen5,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            supportTickets.isEmpty
                ? Text(tSupportScreen6)
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
