/// Provider del Dashboard
/// 
/// Gestiona el estado del dashboard con datos mock
/// En el futuro se conectará con use cases y repositorios

import 'package:flutter/foundation.dart';

/// Modelo de datos mock para el resumen de progreso
class ProgressSummary {
  final int level;
  final int currentXp;
  final int xpToNextLevel;
  final int questionsToday;
  final int xpToday;
  final int streakDays;
  
  ProgressSummary({
    required this.level,
    required this.currentXp,
    required this.xpToNextLevel,
    required this.questionsToday,
    required this.xpToday,
    required this.streakDays,
  });
  
  double get progressPercentage => xpToNextLevel > 0 
      ? (currentXp / xpToNextLevel).clamp(0.0, 1.0)
      : 0.0;
}

class DashboardProvider extends ChangeNotifier {
  // Datos mock del usuario
  ProgressSummary _progressSummary = ProgressSummary(
    level: 5,
    currentXp: 2500,
    xpToNextLevel: 3000,
    questionsToday: 15,
    xpToday: 150,
    streakDays: 7,
  );
  
  ProgressSummary get progressSummary => _progressSummary;
  
  DashboardProvider() {
    // En el futuro, aquí se cargarían los datos reales
    _loadDashboardData();
  }
  
  Future<void> _loadDashboardData() async {
    // Simula carga de datos
    await Future.delayed(const Duration(milliseconds: 500));
    notifyListeners();
  }
  
  /// Actualiza el resumen de progreso (mock)
  void updateProgressSummary(ProgressSummary summary) {
    _progressSummary = summary;
    notifyListeners();
  }
}

