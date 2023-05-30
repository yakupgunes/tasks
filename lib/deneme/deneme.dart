import 'package:flutter/material.dart';

// Yeni görevler sayfası
class NewTaskScreen extends StatefulWidget {
  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  List<Task> tasks = [
    Task(name: 'Görev 1'),
    Task(name: 'Görev 2'),
    Task(name: 'Görev 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Yeni Görevler'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(task.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskDetailScreen(task: task),
                ),
              ).then((result) {
                if (result == true) {
                  setState(() {
                    tasks.remove(task);
                  });
                }
              });
            },
          );
        },
      ),
    );
  }
}

// Görev detayları sayfası
class TaskDetailScreen extends StatelessWidget {
  final Task task;

  TaskDetailScreen({required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.name),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Görev İçeriği: ${task.name}'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            child: Text('Görevi Yaptım'),
          ),
        ],
      ),
    );
  }
}

// Görevlerim sayfası
class MyTasksScreen extends StatefulWidget {
  @override
  _MyTasksScreenState createState() => _MyTasksScreenState();
}

class _MyTasksScreenState extends State<MyTasksScreen> {
  List<Task> completedTasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Görevlerim'),
      ),
      body: ListView.builder(
        itemCount: completedTasks.length,
        itemBuilder: (context, index) {
          final task = completedTasks[index];
          return ListTile(
            title: Text(task.name),
            subtitle: Text('Tamamlandı'),
          );
        },
      ),
    );
  }
}

// Görev sınıfı
class Task {
  final String name;

  Task({required this.name});
}

void main() {
  runApp(MyApp());
}

// Ana uygulama
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Görev Yöneticisi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewTaskScreen(),
    );
  }
}
