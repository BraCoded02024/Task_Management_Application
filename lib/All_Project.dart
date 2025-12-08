import 'package:flutter/material.dart';
import 'main.dart';
import 'taskmanager.dart';
import 'week2.dart';

class All_Project extends StatelessWidget {
  const All_Project({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Weekly Project",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
   SizedBox(height: 25),
          Container( child:
          ElevatedButton(
            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TaskManager(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),
            ),
            child: const Text('Week 1'),
          ),),
          SizedBox(height: 25),
          ElevatedButton(onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  LibraryApp(),
                ));
          },
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 50),
            ),
           child: Text("Week 2"),

            )],
      ),
    );
  }
}
