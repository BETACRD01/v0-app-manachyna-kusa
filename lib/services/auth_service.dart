import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;
  bool _isLoading = false;
  String? _error;
  Map<String, dynamic>? _userData;

  // Getters
  bool get isAuthenticated => _isAuthenticated;
  bool get isLoading => _isLoading;
  String? get error => _error;
  Map<String, dynamic>? get userData => _userData;

  // Iniciar sesión
  Future<bool> login(String phone, String password) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // Simulamos un login exitoso
      await Future.delayed(const Duration(seconds: 1));
      
      _isAuthenticated = true;
      _userData = {
        'nombre': 'Usuario',
        'apellido': 'Ejemplo',
        'telefono': phone,
        'email': 'usuario@ejemplo.com',
      };
      
      return true;
    } catch (e) {
      _error = e.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Registrar usuario
  Future<bool> register(Map<String, dynamic> userData, String password) async {
    try {
      _isLoading = true;
      _error = null;
      notifyListeners();

      // Simulamos un registro exitoso
      await Future.delayed(const Duration(seconds: 1));
      
      _isAuthenticated = true;
      _userData = userData;
      
      return true;
    } catch (e) {
      _error = e.toString();
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Cerrar sesión
  void logout() {
    _isAuthenticated = false;
    _userData = null;
    notifyListeners();
  }
}
