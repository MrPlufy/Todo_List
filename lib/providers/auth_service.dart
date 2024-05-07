import 'dart:async';

import 'package:flutter/material.dart';

class AuthService {
  Future<bool> login({required String email, required String password}) async {
    // Lakukan logika autentikasi di sini, contoh sederhana hanya membandingkan email dan password
    return email == 'ahmad@gmail.com' && password == 'password';
  }
}

class AuthProvider extends ChangeNotifier {
  final AuthService _authService;

  AuthProvider(this._authService);

  Future<bool> login({required String email, required String password}) async {
    final result = await _authService.login(email: email, password: password);
    if (result) {
      // Jika autentikasi berhasil, lakukan sesuatu di sini, misalnya menyimpan data pengguna
    }
    return result;
  }
}
