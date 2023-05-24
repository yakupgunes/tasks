import 'package:kolaypara/src/constants/image_strings.dart';

class Task {
  final String name;
  final int capacity;
  final int points;
  final String imagePath;

  Task({
    required this.name,
    required this.capacity,
    required this.points,
    required this.imagePath,
  });
}

final List<Task> tasks = [
  Task(
    name: 'Görev - 1',
    capacity: 10,
    points: 100,
    imagePath: tUserProfileImages,
  ),
  Task(
    name: 'Görev - 2',
    capacity: 5,
    points: 50,
    imagePath: tUserProfileImages,
  ),
  Task(
    name: 'Görev - 3',
    capacity: 8,
    points: 80,
    imagePath: tUserProfileImages,
  ),
];
