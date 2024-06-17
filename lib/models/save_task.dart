import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:uts_ahmad/models/task_model.dart';

class SaveTask extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(title: 'Learn Flutter', isCompleted: true),
    Task(title: 'Drink Water', isCompleted: false),
    Task(title: 'Play Football', isCompleted: true),
    Task(title: 'Add More Todos', isCompleted: false),
  ];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  void checkTask(int index) {
    tasks[index].isDone();
    notifyListeners();
  }

  void fetchTodos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos?_limit=10'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      List<Task> getted =
          jsonResponse.map((todo) => Task.fromJson(todo)).toList();
      tasks.addAll(getted);
      notifyListeners();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}
