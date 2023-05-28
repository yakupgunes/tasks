import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String? id;
  final String name;
  final int capacity;
  final String content;
  final int points;
  final String image;

  TaskModel(
      {this.id,
      required this.name,
      required this.capacity,
      required this.content,
      required this.points,
      required this.image});

  tojson() {
    return {
      "Name": name,
      "Capacity": capacity,
      "Content": content,
      "Points": points,
      "Image": image,
    };
  }

  factory TaskModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return TaskModel(
      name: data['name'],
      capacity: data['capacity'],
      content: data['content'],
      points: data['points'],
      image: data['image'],
    );
  }
}
