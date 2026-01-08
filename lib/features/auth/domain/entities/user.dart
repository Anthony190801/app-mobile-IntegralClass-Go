/// Entidad User
/// 
/// Representa un usuario en la capa de dominio.
/// Es independiente de frameworks y fuentes de datos.

class User {
  final String id;
  final String name;
  final String email;
  final String? username;
  final int level;
  final int xp;
  final int streak;
  final String? profileImageUrl;
  
  const User({
    required this.id,
    required this.name,
    required this.email,
    this.username,
    required this.level,
    required this.xp,
    required this.streak,
    this.profileImageUrl,
  });
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User &&
        other.id == id &&
        other.email == email;
  }
  
  @override
  int get hashCode => id.hashCode ^ email.hashCode;
}

