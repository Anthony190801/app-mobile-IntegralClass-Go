/// Modelo de datos User (DTO)
/// 
/// Representa los datos de usuario desde la API o almacenamiento local.
/// Extiende o mapea a la entidad User del dominio.

import '../../domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.name,
    required super.email,
    super.username,
    required super.level,
    required super.xp,
    required super.streak,
    super.profileImageUrl,
  });
  
  /// Crea un UserModel desde un JSON (API)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      username: json['username'] as String?,
      level: json['level'] as int,
      xp: json['xp'] as int,
      streak: json['streak'] as int,
      profileImageUrl: json['profile_image_url'] as String?,
    );
  }
  
  /// Convierte un UserModel a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'level': level,
      'xp': xp,
      'streak': streak,
      'profile_image_url': profileImageUrl,
    };
  }
  
  /// Convierte el modelo a entidad de dominio
  User toEntity() {
    return User(
      id: id,
      name: name,
      email: email,
      username: username,
      level: level,
      xp: xp,
      streak: streak,
      profileImageUrl: profileImageUrl,
    );
  }
}

