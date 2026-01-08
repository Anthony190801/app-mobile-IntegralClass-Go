/// Provider de autenticación
/// 
/// Gestiona el estado de autenticación de la aplicación
/// usando Provider pattern para state management

import 'package:flutter/foundation.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/register_user.dart';
import '../../domain/usecases/logout_user.dart';
import '../../domain/usecases/get_current_user.dart';

class AuthProvider extends ChangeNotifier {
  final LoginUser loginUser;
  final RegisterUser registerUser;
  final LogoutUser logoutUser;
  final GetCurrentUser getCurrentUser;
  
  User? _user;
  bool _isLoading = false;
  String? _error;
  
  User? get user => _user;
  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isAuthenticated => _user != null;
  
  AuthProvider({
    required this.loginUser,
    required this.registerUser,
    required this.logoutUser,
    required this.getCurrentUser,
  });
  
  /// Inicia sesión con email y contraseña
  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    final result = await loginUser(LoginParams(
      email: email,
      password: password,
    ));
    
    return result.fold(
      (failure) {
        _error = failure.message;
        _isLoading = false;
        notifyListeners();
        return false;
      },
      (user) {
        _user = user;
        _error = null;
        _isLoading = false;
        notifyListeners();
        return true;
      },
    );
  }
  
  /// Registra un nuevo usuario
  Future<bool> register({
    required String email,
    required String password,
    required String confirmPassword,
    required String name,
    String? username,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    
    final result = await registerUser(RegisterParams(
      email: email,
      password: password,
      confirmPassword: confirmPassword,
      name: name,
      username: username,
    ));
    
    return result.fold(
      (failure) {
        _error = failure.message;
        _isLoading = false;
        notifyListeners();
        return false;
      },
      (user) {
        _user = user;
        _error = null;
        _isLoading = false;
        notifyListeners();
        return true;
      },
    );
  }
  
  /// Cierra la sesión del usuario
  Future<void> performLogout() async {
    _isLoading = true;
    notifyListeners();
    
    final result = await logoutUser();
    
    result.fold(
      (failure) {
        _error = failure.message;
      },
      (_) {
        _user = null;
        _error = null;
      },
    );
    
    _isLoading = false;
    notifyListeners();
  }
  
  /// Obtiene el usuario actual
  Future<void> loadCurrentUser() async {
    _isLoading = true;
    notifyListeners();
    
    final result = await getCurrentUser();
    
    result.fold(
      (failure) {
        _error = failure.message;
        _user = null;
      },
      (user) {
        _user = user;
        _error = null;
      },
    );
    
    _isLoading = false;
    notifyListeners();
  }
  
  /// Limpia el error actual
  void clearError() {
    _error = null;
    notifyListeners();
  }
}
