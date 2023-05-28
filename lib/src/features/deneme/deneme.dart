import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Görevler'),
      ),
      body: const TaskListWidget(),
    );
  }
}

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DocumentSnapshot>>(
      future: getTasks(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<DocumentSnapshot> taskDocs = snapshot.data!;
          return ListView.builder(
            itemCount: taskDocs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot taskDoc = taskDocs[index];
              Map<String, dynamic> taskData =
                  taskDoc.data() as Map<String, dynamic>;
              String taskName = taskData['taskName'];
              String taskContent = taskData['taskContent'];

              return ListTile(
                title: Text(taskName),
                subtitle: Text(taskContent),
              );
            },
          );
        }
      },
    );
  }
}

Future<List<DocumentSnapshot>> getTasks() async {
  QuerySnapshot snapshot = await firestore.collection('Tasks').get();
  return snapshot.docs;
}
