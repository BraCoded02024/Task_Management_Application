import 'package:flutter/material.dart';

class TaskManager extends StatefulWidget {
  const TaskManager({super.key});

  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  List<String> taskTitles = [];
  List<bool> taskCompletion = [];
  List<String> taskDescriptions = [];

  bool _showAddForm = false;
  bool _showTaskList = true;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  void _addNewTask() {
    setState(() {
      taskTitles.add(_titleController.text);
      taskDescriptions.add(_descController.text);
      taskCompletion.add(false); // New tasks start as incomplete
      _showAddForm = false;
      _showTaskList = true;

      _titleController.clear();
      _descController.clear();
    });
  }

  void _showForm() {
    setState(() {
      _showAddForm = true;
    });
  }

  void _hideForm() {
    setState(() {
      _showAddForm = false;
      _titleController.clear();
      _descController.clear();
    });
  }

  void _showAllTasks() {
    setState(() {
      _showTaskList = true;
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      taskCompletion[index] = !taskCompletion[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Task Manager",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Buttons
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _showAllTasks,
                  child: const Text('All Tasks'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _showForm,
                  child: const Text('Add New Task'),
                ),
                SizedBox(width: 10),

              ],
            ),
          ),

          // Add Task Form
          if (_showAddForm)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(
                      labelText: 'Task Title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _descController,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _addNewTask,
                        child: Text('Add Task'),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: _hideForm,
                        child: Text('Cancel'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          // Task List
          if (_showTaskList)
            Expanded(
              child: taskTitles.isEmpty
                  ? Center(
                child: Text(
                  'No tasks yet. Add your first task!',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              )
                  : ListView.builder(
                itemCount: taskTitles.length,
                itemBuilder: (context, index) {
                  bool isComplete = taskCompletion[index];

                  return ListTile(
                    title: Text(
                      taskTitles[index],
                      style: TextStyle(
                        decoration: isComplete
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                        color: isComplete ? Colors.grey : Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      taskDescriptions[index],
                      style: TextStyle(
                        color: isComplete ? Colors.grey : Colors.black54,
                      ),
                    ),
                    leading: Checkbox(
                      value: isComplete,
                      onChanged: (value) {
                        _toggleTaskCompletion(index);
                      },
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Status indicator
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: isComplete
                                ? Colors.green.shade100
                                : Colors.orange.shade100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            isComplete ? 'Complete' : 'Incomplete',
                            style: TextStyle(
                              fontSize: 12,
                              color: isComplete
                                  ? Colors.green.shade800
                                  : Colors.orange.shade800,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              taskTitles.removeAt(index);
                              taskDescriptions.removeAt(index);
                              taskCompletion.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}