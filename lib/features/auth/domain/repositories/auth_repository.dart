/// Interface del repositorio de autenticación
/// 
/// Define el contrato para acceso a datos de autenticación.
/// La implementación está en la capa de datos.

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  /// Autentica un usuario con email y contraseña
  Future<Either<Failure, User>> login(String email, String password);
  
  /// Registra un nuevo usuario
  Future<Either<Failure, User>> register({
    required String email,
    required String password,
    required String name,
    String? username,
  });
  
  /// Obtiene el usuario actualmente autenticado
  Future<Either<Failure, User>> getCurrentUser();
  
  /// Cierra la sesión del usuario actual
  Future<Either<Failure, void>> logout();
  
  /// Recupera contraseña mediante email
  Future<Either<Failure, void>> forgotPassword(String email);
  
  /// Actualiza el perfil del usuario
  Future<Either<Failure, User>> updateProfile(User user);
}

