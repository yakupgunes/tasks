class Task {
  final String name;
  final int points;
  final String date;
  final String status;

  Task({
    required this.name,
    required this.points,
    required this.date,
    required this.status,
  });
}

final List<Task> tasks = [
  Task(
    name: 'Görev 1',
    points: 100,
    date: '15 Mayıs 2023',
    status: 'Tamamlandı',
  ),
  Task(
    name: 'Görev 2',
    points: 50,
    date: '18 Mayıs 2023',
    status: 'Tamamlandı',
  ),
  Task(
    name: 'Görev 3',
    points: 80,
    date: '20 Mayıs 2023',
    status: 'Tamamlandı',
  ),
];
