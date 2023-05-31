// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:kolaypara/src/constants/text_strings.dart';
import 'support_screen_class.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  _SupportScreenState createState() => _SupportScreenState();
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

    if (subject.isEmpty || message.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text(tSupportScreen7),
          content: const Text(tSupportScreen8),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(tSupportScreen9),
            ),
          ],
        ),
      );
      return;
    }

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
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              tSupportScreen1,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: subjectController,
              decoration: const InputDecoration(
                labelText: tSupportScreen2,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: messageController,
              decoration: const InputDecoration(
                labelText: tSupportScreen3,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                submitSupportTicket();
              },
              child: const Text(tSupportScreen4),
            ),
            const SizedBox(height: 32),
            const Text(
              tSupportScreen5,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            supportTickets.isEmpty
                ? const Text(tSupportScreen6)
                : Column(
                    children: supportTickets
                        .map(
                          (ticket) => Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Konu: ${ticket.subject}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text('Mesaj: ${ticket.message}'),
                                const Divider(),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
          ],
        ),
      ),
    );
  }
}
