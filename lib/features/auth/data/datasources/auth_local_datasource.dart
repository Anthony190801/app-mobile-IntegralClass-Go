/// Data Source local para autenticación
/// 
/// Implementa el almacenamiento local de datos de autenticación
/// (tokens, usuario actual, etc.)

import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  /// Guarda el token de autenticación
  Future<void> cacheAuthToken(String token);
  
  /// Obtiene el token de autenticación guardado
  Future<String?> getAuthToken();
  
  /// Guarda los datos del usuario actual
  Future<void> cacheUser(UserModel user);
  
  /// Obtiene los datos del usuario actual guardados
  Future<UserModel?> getCachedUser();
  
  /// Elimina todos los datos de autenticación
  Future<void> clearAuthData();
}

