/// Implementación mock del Local Data Source de autenticación
/// 
/// Simula almacenamiento local para desarrollo sin persistencia real

import '../models/user_model.dart';
import 'auth_local_datasource.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  // Mock: Simula almacenamiento local en memoria
  String? _cachedToken;
  UserModel? _cachedUser;
  
  @override
  Future<void> cacheAuthToken(String token) async {
    // Simula delay de escritura
    await Future.delayed(const Duration(milliseconds: 100));
    _cachedToken = token;
  }
  
  @override
  Future<String?> getAuthToken() async {
    // Simula delay de lectura
    await Future.delayed(const Duration(milliseconds: 50));
    return _cachedToken;
  }
  
  @override
  Future<void> cacheUser(UserModel user) async {
    // Simula delay de escritura
    await Future.delayed(const Duration(milliseconds: 100));
    _cachedUser = user;
  }
  
  @override
  Future<UserModel?> getCachedUser() async {
    // Simula delay de lectura
    await Future.delayed(const Duration(milliseconds: 50));
    return _cachedUser;
  }
  
  @override
  Future<void> clearAuthData() async {
    // Simula delay de limpieza
    await Future.delayed(const Duration(milliseconds: 100));
    _cachedToken = null;
    _cachedUser = null;
  }
}

