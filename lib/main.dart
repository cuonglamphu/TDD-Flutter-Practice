// lib/main.dart
import 'package:flutter/material.dart';
import 'screens/task_screen.dart'; // Import màn hình chính của ứng dụng

void main() {
  runApp(TaskManagerApp());
}

class TaskManagerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskScreen(), // Đặt màn hình TaskScreen là màn hình chính
    );
  }
}
