/// Provider de gamificación
/// 
/// Gestiona el estado de gamificación: XP, niveles y logros

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/user_progress.dart';
import '../models/achievement.dart';

class GamificationProvider extends ChangeNotifier {
  // Progreso del usuario
  UserProgress _progress = UserProgress(
    totalXp: 2500,
    level: 5,
    streakDays: 7,
  );
  
  // Lista de logros
  List<Achievement> _achievements = [];
  
  UserProgress get progress => _progress;
  List<Achievement> get achievements => _achievements;
  List<Achievement> get unlockedAchievements =>
      _achievements.where((a) => a.isUnlocked).toList();
  List<Achievement> get lockedAchievements =>
      _achievements.where((a) => !a.isUnlocked).toList();
  
  GamificationProvider() {
    _initializeAchievements();
    _loadProgress();
  }
  
  /// Inicializa los logros mock
  void _initializeAchievements() {
    _achievements = [
      Achievement(
        id: 'first_question',
        name: 'Primera Pregunta',
        description: 'Responde tu primera pregunta',
        icon: Icons.star,
        isUnlocked: true,
        unlockedAt: DateTime.now().subtract(const Duration(days: 10)),
      ),
      Achievement(
        id: 'practice_master',
        name: 'Maestro de Práctica',
        description: 'Completa 10 prácticas',
        icon: Icons.quiz,
        isUnlocked: true,
        unlockedAt: DateTime.now().subtract(const Duration(days: 5)),
      ),
      Achievement(
        id: 'streak_7',
        name: 'Semana Perfecta',
        description: 'Mantén una racha de 7 días',
        icon: Icons.local_fire_department,
        isUnlocked: true,
        unlockedAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Achievement(
        id: 'level_10',
        name: 'Experto Nivel 10',
        description: 'Alcanza el nivel 10',
        icon: Icons.emoji_events,
        isUnlocked: false,
      ),
      Achievement(
        id: 'perfect_score',
        name: 'Puntuación Perfecta',
        description: 'Obtén 100% en una práctica',
        icon: Icons.check_circle,
        isUnlocked: false,
      ),
      Achievement(
        id: 'practice_100',
        name: 'Centurión',
        description: 'Completa 100 prácticas',
        icon: Icons.military_tech,
        isUnlocked: false,
      ),
    ];
  }
  
  /// Carga el progreso (mock - en el futuro desde repositorio)
  Future<void> _loadProgress() async {
    // Simula carga de datos
    await Future.delayed(const Duration(milliseconds: 300));
    notifyListeners();
  }
  
  /// Agrega XP al usuario y recalcula el nivel
  void addXp(int amount) {
    if (amount <= 0) return;
    
    final previousLevel = _progress.level;
    _progress = _progress.copyWith(
      totalXp: _progress.totalXp + amount,
    );
    
    // Recalcular nivel (cada 100 XP = 1 nivel)
    final newLevel = (_progress.totalXp / 100).floor();
    if (newLevel > _progress.level) {
      _progress = _progress.copyWith(level: newLevel);
      
      // Notificar subida de nivel si ocurrió
      if (newLevel > previousLevel) {
        _onLevelUp(newLevel);
      }
    }
    
    notifyListeners();
  }
  
  /// Maneja el evento de subida de nivel
  void _onLevelUp(int newLevel) {
    // Verificar si se desbloquea algún logro relacionado con niveles
    if (newLevel >= 10) {
      _unlockAchievement('level_10');
    }
  }
  
  /// Desbloquea un logro
  void _unlockAchievement(String achievementId) {
    final index = _achievements.indexWhere((a) => a.id == achievementId);
    if (index != -1 && !_achievements[index].isUnlocked) {
      _achievements[index] = _achievements[index].copyWith(
        isUnlocked: true,
        unlockedAt: DateTime.now(),
      );
      notifyListeners();
    }
  }
  
  /// Desbloquea un logro manualmente (para testing)
  void unlockAchievement(String achievementId) {
    _unlockAchievement(achievementId);
  }
  
  /// Resetea el progreso (útil para testing)
  void resetProgress() {
    _progress = UserProgress(
      totalXp: 0,
      level: 1,
      streakDays: 0,
    );
    notifyListeners();
  }
  
  /// Actualiza la racha de días
  void updateStreak(int days) {
    _progress = _progress.copyWith(streakDays: days);
    
    // Verificar logro de racha
    if (days >= 7 && !_achievements.any((a) => a.id == 'streak_7' && a.isUnlocked)) {
      _unlockAchievement('streak_7');
    }
    
    notifyListeners();
  }
}

