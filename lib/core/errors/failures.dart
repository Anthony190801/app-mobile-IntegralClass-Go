/// Clases base para manejo de errores (Failures)
/// 
/// Siguiendo Clean Architecture, los errores se representan como Failures
/// en la capa de dominio, independientes de implementaciones específicas.

/// Clase abstracta base para todos los tipos de Failure
abstract class Failure {
  final String message;
  
  Failure(this.message);
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Failure && other.message == message;
  }
  
  @override
  int get hashCode => message.hashCode;
}

/// Failure relacionado con errores del servidor
class ServerFailure extends Failure {
  ServerFailure([String? message]) : super(message ?? 'Error del servidor');
}

/// Failure relacionado con problemas de red/conexión
class NetworkFailure extends Failure {
  NetworkFailure() : super('Sin conexión a internet');
}

/// Failure relacionado con errores de cache/almacenamiento local
class CacheFailure extends Failure {
  CacheFailure([String? message]) : super(message ?? 'Error de almacenamiento local');
}

/// Failure relacionado con validaciones
class ValidationFailure extends Failure {
  ValidationFailure(String message) : super(message);
}

/// Failure desconocido o no categorizado
class UnknownFailure extends Failure {
  UnknownFailure([String? message]) : super(message ?? 'Error desconocido');
}

