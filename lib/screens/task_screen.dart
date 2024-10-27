// lib/screens/task_screen.dart
import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final List<Task> tasks = [];

  void _addTask(String taskName) {
    setState(() {
      tasks.add(Task(name: taskName));
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  void _deleteCompletedTasks() {
    setState(() {
      tasks.removeWhere((task) => task.isCompleted);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Manager')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(
              task.name,
              style: TextStyle(
                  decoration:
                      task.isCompleted ? TextDecoration.lineThrough : null),
            ),
            onTap: () => _toggleTaskCompletion(index),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _showAddTaskDialog(context),
            tooltip: 'Add Task',
            child: Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _deleteCompletedTasks,
            tooltip: 'Delete Completed Tasks',
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    final TextEditingController taskController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Task'),
          content: TextField(
            controller: taskController,
            decoration: const InputDecoration(hintText: 'Task name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _addTask(taskController.text);
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
