import 'package:flutter/material.dart';
import 'taskmanager.dart';
import "package:flutter/material.dart";
import 'taskmanager.dart';
void main() {
  runApp(const bernard());
}

class bernard extends StatelessWidget {
  const bernard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(primaryColor: Colors.grey),
      debugShowCheckedModeBanner: false,
   home: TaskManager(), );

  }
}
