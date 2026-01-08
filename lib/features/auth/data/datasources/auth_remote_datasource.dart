/// Data Source remoto para autenticación
/// 
/// Implementa el acceso a datos de autenticación desde la API REST

import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  /// Autentica usuario en el servidor
  Future<UserModel> login(String email, String password);
  
  /// Registra nuevo usuario en el servidor
  Future<UserModel> register({
    required String email,
    required String password,
    required String name,
    String? username,
  });
  
  /// Obtiene usuario actual desde el servidor
  Future<UserModel> getCurrentUser();
  
  /// Solicita recuperación de contraseña
  Future<void> forgotPassword(String email);
  
  /// Actualiza perfil en el servidor
  Future<UserModel> updateProfile(UserModel user);
}

