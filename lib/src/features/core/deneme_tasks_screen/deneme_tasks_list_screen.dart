// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kolaypara/src/features/authentication/models/task_model.dart';
import 'package:kolaypara/src/features/core/deneme_tasks_screen/deneme_task_content_screen.dart';
import 'package:kolaypara/src/repository/authentication_repository/authentication_repository.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key}); // Oturum açılan e-posta adresi
  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  late Stream<QuerySnapshot> _taskStream;
  String? email;

  @override
  void initState() {
    super.initState();
    _taskStream = FirebaseFirestore.instance
        .collection('Tasks')
        .orderBy('name')
        .snapshots();

    _getEmail();
  }

  Future<void> _getEmail() async {
    AuthenticationRepository.instance.email;

    // Örnek bir simülasyon, 2 saniye bekleme
    await Future.delayed(Duration(seconds: 1));

    // E-posta adresini güncelle
    setState(() {
      email = AuthenticationRepository.instance.email.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: _taskStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Veriler alınırken bir hata oluştu.'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('Görev bulunamadı.'),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final task = TaskModel.fromSnapshot(snapshot.data!.docs[index]
                  as DocumentSnapshot<Map<String, dynamic>>);

              return ListTile(
                title: Text(task.name),
                subtitle:
                    Text('Kapasite: ${task.capacity}, Puan: ${task.points}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskContentScreen(
                        content: task.content,
                        taskId: task.id,
                        email: email!,
                      ),
                    ),
                  );
                  // Görev tıklandığında yapılacak işlemler
                },
              );
            },
          );
        },
      ),
    );
  }
}
