/// Caso de uso: Registro de usuario
/// 
/// Ejecuta la lógica de negocio para registrar un nuevo usuario

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;
  
  RegisterUser(this.repository);
  
  Future<Either<Failure, User>> call(RegisterParams params) async {
    // Validación básica de contraseñas
    if (params.password != params.confirmPassword) {
      return Left(ValidationFailure('Las contraseñas no coinciden'));
    }
    
    if (params.password.length < 6) {
      return Left(ValidationFailure('La contraseña debe tener al menos 6 caracteres'));
    }
    
    return await repository.register(
      email: params.email,
      password: params.password,
      name: params.name,
      username: params.username,
    );
  }
}

class RegisterParams {
  final String email;
  final String password;
  final String confirmPassword;
  final String name;
  final String? username;
  
  RegisterParams({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.name,
    this.username,
  });
}

