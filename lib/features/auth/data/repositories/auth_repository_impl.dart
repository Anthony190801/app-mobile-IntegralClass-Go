/// Implementación del repositorio de autenticación
/// 
/// Orquesta los data sources (remote y local) y convierte
/// los modelos a entidades del dominio

import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../datasources/auth_local_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  
  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  
  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final userModel = await remoteDataSource.login(email, password);
      // Guardar token y usuario en cache
      await localDataSource.cacheUser(userModel);
      return Right(userModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException {
      return Left(NetworkFailure());
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, User>> register({
    required String email,
    required String password,
    required String name,
    String? username,
  }) async {
    try {
      final userModel = await remoteDataSource.register(
        email: email,
        password: password,
        name: name,
        username: username,
      );
      // Guardar token y usuario en cache
      await localDataSource.cacheUser(userModel);
      return Right(userModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException {
      return Left(NetworkFailure());
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      // Intentar obtener desde cache primero
      final cachedUser = await localDataSource.getCachedUser();
      if (cachedUser != null) {
        return Right(cachedUser.toEntity());
      }
      
      // Si no hay cache, obtener del servidor
      final userModel = await remoteDataSource.getCurrentUser();
      await localDataSource.cacheUser(userModel);
      return Right(userModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException {
      return Left(NetworkFailure());
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await localDataSource.clearAuthData();
      return const Right(null);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, void>> forgotPassword(String email) async {
    // TODO: Implementar recuperación de contraseña
    throw UnimplementedError();
  }
  
  @override
  Future<Either<Failure, User>> updateProfile(User user) async {
    // TODO: Implementar actualización de perfil
    throw UnimplementedError();
  }
}

