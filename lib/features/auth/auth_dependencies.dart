/// Configuración de dependencias del módulo de autenticación
/// 
/// Instancia manual de dependencias sin usar get_it por ahora
/// Esto se puede migrar a get_it más adelante

import 'data/datasources/auth_remote_datasource.dart';
import 'data/datasources/auth_local_datasource.dart';
import 'data/datasources/auth_remote_datasource_impl.dart';
import 'data/datasources/auth_local_datasource_impl.dart';
import 'data/repositories/auth_repository_impl.dart';
import 'domain/repositories/auth_repository.dart';
import 'domain/usecases/login_user.dart';
import 'domain/usecases/register_user.dart';
import 'domain/usecases/logout_user.dart';
import 'domain/usecases/get_current_user.dart';
import 'presentation/providers/auth_provider.dart';

/// Crea e instancia todas las dependencias del módulo de autenticación
AuthProvider createAuthProvider() {
  // Data Sources
  final AuthRemoteDataSource remoteDataSource = AuthRemoteDataSourceImpl();
  final AuthLocalDataSource localDataSource = AuthLocalDataSourceImpl();
  
  // Repository
  final AuthRepository repository = AuthRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );
  
  // Use Cases
  final loginUser = LoginUser(repository);
  final registerUser = RegisterUser(repository);
  final logoutUser = LogoutUser(repository);
  final getCurrentUser = GetCurrentUser(repository);
  
  // Provider
  return AuthProvider(
    loginUser: loginUser,
    registerUser: registerUser,
    logoutUser: logoutUser,
    getCurrentUser: getCurrentUser,
  );
}

