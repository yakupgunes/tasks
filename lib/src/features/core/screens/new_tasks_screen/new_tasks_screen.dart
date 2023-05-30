// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'new_tasks.dart';

class NewTasksScreen extends StatelessWidget {
  const NewTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return GestureDetector(
            onTap: () {
              // Görev tıklandığında yapılacak işlemler
              print('Tıklandı: ${task.name}');
            },
            child: Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          task.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Kapasite: ${task.capacity}',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Puan: ${task.points}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  //resim özelliklerinin belirlenme bölümü
                  Image.asset(
                    task.imagePath,
                    width: 100,
                    height: 70,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
