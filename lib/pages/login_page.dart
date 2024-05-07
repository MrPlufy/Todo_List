import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uts_ahmad/providers/auth_service.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                final email = _emailController.text;
                final password = _passwordController.text;
                final authService =
                    Provider.of<AuthProvider>(context, listen: false);
                final success =
                    await authService.login(email: email, password: password);
                if (success) {
                  Navigator.of(context).pushReplacementNamed('/');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Login failed'),
                  ));
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
