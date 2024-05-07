import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_ahmad/models/save_task.dart';
import 'package:uts_ahmad/providers/auth_service.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/login');
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-todo-screen');
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<SaveTask>(
        builder: (context, task, child) {
          return ListView.builder(
            itemCount: task.tasks.length,
            itemBuilder: (BuildContext context, index) {
              return ListTile(
                title: Text(
                  task.tasks[index].title,
                  style: TextStyle(
                    decoration: task.tasks[index].isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                trailing: Wrap(
                  children: [
                    Checkbox(
                      value: task.tasks[index].isCompleted,
                      onChanged: (_) {
                        context.read<SaveTask>().checkTask(index);
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text("Confirmation"),
                                content: const Text(
                                    "Are you sure to delete this list?"),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      context.read<SaveTask>().removeTask(
                                            task.tasks[index],
                                          );
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Delete'),
                                  ),
                                ],
                              );
                            });
                      },
                      icon: const Icon(
                        Icons.delete,
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
