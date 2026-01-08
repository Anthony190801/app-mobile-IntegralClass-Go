/// Modelo de progreso del usuario
/// 
/// Contiene toda la información de gamificación del usuario

class UserProgress {
  final int totalXp;
  final int level;
  final int streakDays;
  
  UserProgress({
    required this.totalXp,
    required this.level,
    required this.streakDays,
  });
  
  /// Calcula el XP requerido para el siguiente nivel
  int get xpForNextLevel => (level + 1) * 100;
  
  /// Calcula el XP actual dentro del nivel actual
  int get xpInCurrentLevel => totalXp - (level * 100);
  
  /// Calcula el porcentaje de progreso hacia el siguiente nivel
  double get progressToNextLevel {
    final xpNeeded = xpForNextLevel - (level * 100);
    if (xpNeeded <= 0) return 1.0;
    return (xpInCurrentLevel / xpNeeded).clamp(0.0, 1.0);
  }
  
  UserProgress copyWith({
    int? totalXp,
    int? level,
    int? streakDays,
  }) {
    return UserProgress(
      totalXp: totalXp ?? this.totalXp,
      level: level ?? this.level,
      streakDays: streakDays ?? this.streakDays,
    );
  }
}

