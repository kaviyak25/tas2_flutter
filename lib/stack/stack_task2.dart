import 'package:flutter/material.dart';
import 'dart:collection';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final queue = ListQueue<int>();
  final stack = Stack<int>();
  String message = '';

  _MyAppState() {
    queue.addAll([1, 2, 3]);
    queue.addFirst(4);
    queue.addLast(5);

    stack.push(3);
    stack.push(2);
    stack.push(5);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Stack and Queue App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Stack and Queue App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Queue Contents: ${queue.join(", ")}',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Stack Contents: ${stack.join(", ")}',
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                onPressed: () {
                  final random = Random();
                  // Add an item to the queue and stack
                  final newItem = random.nextInt(100);
                  queue.add(newItem);
                  stack.push(newItem);
                  print('Adding item $newItem'); // Display adding message
                  setState(() {
                    message = 'Adding items'; // Update the message
                  });
                },
                child: Text('Add Item'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Remove an item from the stack
                  final removedItem = stack.pop();
                  if (stack.isEmpty) {
                    setState(() {
                      message = 'Stack is empty'; // Update the message
                    });
                  } else {
                    setState(() {
                      message =
                          'removing items'; // Clear the message if the stack is not empty
                    });
                  }
                  if (removedItem != null) {
                    print('Removed item $removedItem');
                  }
                },
                child: Text('Remove from Stack'),
              ),
              Text(
                message, // Display the message
                style: TextStyle(
                    fontSize: 20, color: Colors.red), // Customize the style
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Stack<T> {
  final queue = Queue<T>();
  bool get isEmpty => queue.isEmpty;
  void push(T t) {
    queue.addFirst(t);
  }

  T? pop() {
    if (queue.isNotEmpty) {
      final first = queue.first;
      queue.removeFirst();
      return first;
    }
    return null;
  }

  String join(String separator) {
    return queue.join(separator);
  }
}
