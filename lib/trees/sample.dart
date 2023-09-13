import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Task {
  final String name;
  final List<Task> subtasks;

  Task(this.name, this.subtasks);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define a sample task hierarchy
    final Task rootTask = Task(
      'Flutter Training',
      [
        Task('Udemy course', []),
        Task('Data Structures', [
          Task('Trees', []),
          Task('LinkedList', []),
        ]),
        Task('StateManagement', []),
      ],
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(' Flutter Task List'),
        ),
        body: TaskList(task: rootTask),
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  final Task task;

  TaskList({required this.task});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(task.name),
        ),
        if (task.subtasks.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Column(
              children: task.subtasks
                  .map((subtask) => TaskList(task: subtask))
                  .toList(),
            ),
          ),
      ],
    );
  }
}
