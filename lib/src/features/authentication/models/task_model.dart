import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  final String name;
  final int capacity;
  final String content;
  final int points;
  final String image;

  TaskModel(
      {required this.name,
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

  /*factory TaskModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return TaskModel(
      name: data['name'] ?? '',
      capacity: data['capacity'] ?? 0,
      content: data['content'] ?? '',
      points: data['points'] ?? 0,
      image: data['image'] ?? '',
    );
  }*/

  factory TaskModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return TaskModel(
      name: data['name'] ?? '',
      capacity: data['capacity'] ?? 0,
      content: data['content'] ?? '',
      points: data['points'] ?? 0,
      image: data['image'] ?? '',
    );
  }
}
