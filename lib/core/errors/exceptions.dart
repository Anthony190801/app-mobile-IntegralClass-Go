/// Excepciones de la aplicación
/// 
/// Estas excepciones son lanzadas en la capa de datos y convertidas
/// a Failures en los repositorios antes de llegar a la capa de dominio.

/// Excepción base para todas las excepciones de la app
class AppException implements Exception {
  final String message;
  
  AppException(this.message);
  
  @override
  String toString() => message;
}

/// Excepción de servidor
class ServerException extends AppException {
  ServerException([String? message]) : super(message ?? 'Error del servidor');
}

/// Excepción de red
class NetworkException extends AppException {
  NetworkException() : super('Sin conexión a internet');
}

/// Excepción de cache
class CacheException extends AppException {
  CacheException([String? message]) : super(message ?? 'Error de almacenamiento local');
}

