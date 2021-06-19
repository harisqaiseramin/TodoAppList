import 'package:flutter/material.dart';
import 'package:todoapp/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Todo App")),
          backgroundColor: Colors.blue,
        ),
        body: Todo(),
      ),
    );
  }
}
