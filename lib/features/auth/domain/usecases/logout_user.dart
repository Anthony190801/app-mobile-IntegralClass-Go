/// Caso de uso: Cerrar sesión
/// 
/// Ejecuta la lógica de negocio para cerrar la sesión del usuario

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/auth_repository.dart';

class LogoutUser {
  final AuthRepository repository;
  
  LogoutUser(this.repository);
  
  Future<Either<Failure, void>> call() async {
    return await repository.logout();
  }
}

