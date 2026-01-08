/// Implementación mock del Remote Data Source de autenticación
/// 
/// Simula llamadas a la API REST para desarrollo sin backend real

import 'dart:async';
import '../models/user_model.dart';
import 'auth_remote_datasource.dart';
import '../../../../core/errors/exceptions.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  // Mock: Simula una base de datos en memoria
  static final Map<String, Map<String, dynamic>> _mockUsers = {
    'test@integralclass.com': {
      'id': '1',
      'name': 'Usuario de Prueba',
      'email': 'test@integralclass.com',
      'username': 'testuser',
      'password': 'password123', // En producción esto nunca estaría aquí
      'level': 5,
      'xp': 2500,
      'streak': 7,
      'profile_image_url': null,
    },
  };
  
  @override
  Future<UserModel> login(String email, String password) async {
    // Simula delay de red
    await Future.delayed(const Duration(seconds: 1));
    
    final userData = _mockUsers[email];
    
    if (userData == null) {
      throw ServerException('Usuario no encontrado');
    }
    
    if (userData['password'] != password) {
      throw ServerException('Contraseña incorrecta');
    }
    
    // Crear UserModel sin el password
    final userMap = Map<String, dynamic>.from(userData);
    userMap.remove('password');
    
    return UserModel.fromJson(userMap);
  }
  
  @override
  Future<UserModel> register({
    required String email,
    required String password,
    required String name,
    String? username,
  }) async {
    // Simula delay de red
    await Future.delayed(const Duration(seconds: 1));
    
    // Verificar si el email ya existe
    if (_mockUsers.containsKey(email)) {
      throw ServerException('El email ya está registrado');
    }
    
    // Crear nuevo usuario
    final newId = (_mockUsers.length + 1).toString();
    final newUser = {
      'id': newId,
      'name': name,
      'email': email,
      'username': username ?? email.split('@')[0],
      'password': password,
      'level': 1,
      'xp': 0,
      'streak': 0,
      'profile_image_url': null,
    };
    
    _mockUsers[email] = newUser;
    
    final userMap = Map<String, dynamic>.from(newUser);
    userMap.remove('password');
    
    return UserModel.fromJson(userMap);
  }
  
  @override
  Future<UserModel> getCurrentUser() async {
    // Simula delay de red
    await Future.delayed(const Duration(milliseconds: 500));
    
    // TODO: En producción, usar token para obtener usuario
    // Por ahora, retornar el primer usuario como mock
    if (_mockUsers.isEmpty) {
      throw ServerException('Usuario no autenticado');
    }
    
    final firstUser = _mockUsers.values.first;
    final userMap = Map<String, dynamic>.from(firstUser);
    userMap.remove('password');
    
    return UserModel.fromJson(userMap);
  }
  
  @override
  Future<void> forgotPassword(String email) async {
    // Simula delay de red
    await Future.delayed(const Duration(seconds: 1));
    
    if (!_mockUsers.containsKey(email)) {
      throw ServerException('Email no encontrado');
    }
    
    // En producción, aquí se enviaría un email
    // Por ahora solo simula éxito
  }
  
  @override
  Future<UserModel> updateProfile(UserModel user) async {
    // Simula delay de red
    await Future.delayed(const Duration(seconds: 1));
    
    final userData = _mockUsers[user.email];
    if (userData == null) {
      throw ServerException('Usuario no encontrado');
    }
    
    // Actualizar datos
    _mockUsers[user.email] = {
      ...userData,
      'name': user.name,
      'username': user.username,
      'profile_image_url': user.profileImageUrl,
    };
    
    final userMap = Map<String, dynamic>.from(_mockUsers[user.email]!);
    userMap.remove('password');
    
    return UserModel.fromJson(userMap);
  }
}

