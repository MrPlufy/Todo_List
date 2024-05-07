import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_ahmad/models/save_task.dart';
import 'package:uts_ahmad/pages/add_todo.dart';
import 'package:uts_ahmad/pages/login_page.dart';
import 'package:uts_ahmad/pages/todo_list.dart';
import 'package:uts_ahmad/providers/auth_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                AuthProvider(AuthService())), // Tambahkan AuthProvider
        ChangeNotifierProvider(create: (_) => SaveTask()), // Tambahkan SaveTask
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: '/login',
      routes: {
        '/': (_) => const TodoList(),
        '/add-todo-screen': (_) => AddTodo(),
        '/login': (_) => LoginPage(),
      },
    );
  }
}
