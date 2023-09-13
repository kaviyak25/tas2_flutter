// main.dart

import 'package:flutter/material.dart';
import 'linked_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final linkedList = LinkedList<int>();

  @override
  void initState() {
    super.initState();
    linkedList.insert(1);
    linkedList.insert(2);
    linkedList.insert(3);
  }

  void insertElement() {
    linkedList.insert(2);

    setState(() {});
  }

  void removeElement() {
    linkedList.remove(2);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Linked List Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Linked List Contents:',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '${linkedList.toList()}',
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                onPressed: insertElement,
                child: Text('Insert 2'),
              ),
              ElevatedButton(
                onPressed: removeElement,
                child: Text('Remove 2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
