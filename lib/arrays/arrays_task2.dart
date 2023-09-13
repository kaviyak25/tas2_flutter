import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Todo List App',
    home: TodoApp(),
  ));
}

class Task {
  final String name;
  final int number;

  Task(this.name, this.number);
}

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].name),
            subtitle: Text('Task Number: ${tasks[index].number}'),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddTaskDialog(
                    onAddTask: (taskName, taskNumber) {
                      addTask(taskName, taskNumber);
                    },
                  );
                },
              );
            },
            child: Icon(Icons.add),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              reverseTasks();
            },
            child: Icon(Icons.swap_vert),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              printTasks();
            },
            child: Icon(Icons.print),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              createTaskNamesList();
            },
            child: Icon(Icons.list),
          ),
          SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () {
              filterTasks();
            },
            child: Icon(Icons.filter_list),
          ),
        ],
      ),
    );
  }

  void addTask(String taskName, int taskNumber) {
    setState(() {
      final newTask = Task(taskName, taskNumber);
      tasks.add(newTask);

      tasks.sort((a, b) => a.number.compareTo(b.number));
    });
  }

  void reverseTasks() {
    setState(() {
      tasks = tasks.reversed.toList();
    });
  }

  void printTasks() {
    tasks.forEach((task) {
      print('Name: ${task.name}, Number: ${task.number}');
    });
  }

  void createTaskNamesList() {
    List<String> taskNames = tasks.map((task) => task.name).toList();
    print('Task Names: $taskNames');
  }

  void filterTasks() {
    List<Task> filteredTasks = tasks.where((task) => task.number > 5).toList();
    setState(() {
      tasks = filteredTasks;
    });
  }
}

class AddTaskDialog extends StatefulWidget {
  final Function(String, int) onAddTask;

  AddTaskDialog({required this.onAddTask});

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add a New Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Task Name'),
          ),
          TextField(
            controller: numberController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Task Number'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final taskName = nameController.text;
            final taskNumber = int.tryParse(numberController.text) ?? 0;

            if (taskName.isNotEmpty && taskNumber > 0) {
              widget.onAddTask(taskName, taskNumber);
              Navigator.of(context).pop();
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
