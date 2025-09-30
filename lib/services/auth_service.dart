import 'package:flutter/foundation.dart';

class AuthService {
  static const String _adminUser = "Admin123456";
  static const String _adminPassword = "Upt2025";

  bool _isLoggedIn = false;
  String? _currentUser;

  // Singleton pattern
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  // Getters
  bool get isLoggedIn => _isLoggedIn;
  String? get currentUser => _currentUser;

  /// Login para administrador con credenciales locales
  Future<LoginResult> loginAdmin(String username, String password) async {
    try {
      // Simular delay de autenticación
      await Future.delayed(const Duration(seconds: 1));

      if (username.trim() == _adminUser && password == _adminPassword) {
        _isLoggedIn = true;
        _currentUser = username;

        if (kDebugMode) {
          print('Login exitoso para admin: $username');
        }

        return LoginResult(success: true, message: 'Login exitoso');
      } else {
        if (kDebugMode) {
          print('Credenciales incorrectas: $username');
        }

        return LoginResult(
          success: false,
          message: 'Usuario o contraseña incorrectos',
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error en login: $e');
      }

      return LoginResult(
        success: false,
        message: 'Error al iniciar sesión: ${e.toString()}',
      );
    }
  }

  /// Logout del administrador
  Future<void> logout() async {
    _isLoggedIn = false;
    _currentUser = null;

    if (kDebugMode) {
      print('Admin logout exitoso');
    }
  }

  /// Verificar si las credenciales son válidas (para validación)
  bool validateCredentials(String username, String password) {
    return username.trim() == _adminUser && password == _adminPassword;
  }

  /// Verificar si el usuario actual es administrador
  bool isAdmin() {
    return _isLoggedIn && _currentUser == _adminUser;
  }
}

/// Clase para el resultado del login
class LoginResult {
  final bool success;
  final String message;

  LoginResult({required this.success, required this.message});
}
