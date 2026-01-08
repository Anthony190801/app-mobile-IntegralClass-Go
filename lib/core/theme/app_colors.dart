/// Colores corporativos de IntegralClass Go
/// 
/// Define la paleta de colores según el Design System del proyecto
/// Basado en docs/DESIGN_SYSTEM.md

import 'package:flutter/material.dart';

class AppColors {
  AppColors._(); // Constructor privado
  
  // ===== COLORES CORPORATIVOS =====
  /// Azul Principal - #334A8F
  /// Uso: Color primario, botones principales, acentos importantes, headers
  static const Color primaryBlue = Color(0xFF334A8F);
  
  /// Azul Secundario - #3C478C
  /// Uso: Variación del azul principal, elementos secundarios, fondos sutiles
  static const Color secondaryBlue = Color(0xFF3C478C);
  
  /// Verde Acento - #06A45B
  /// Uso: Éxito, respuestas correctas, logros, validaciones positivas
  static const Color accentGreen = Color(0xFF06A45B);
  
  // ===== COLORES DE ESTADO =====
  
  /// Éxito (Success) - Primary
  static const Color success = Color(0xFF06A45B);
  static const Color successLight = Color(0xFF4CD494);
  static const Color successDark = Color(0xFF048A4A);
  
  /// Error - Primary
  static const Color error = Color(0xFFE53935);
  static const Color errorLight = Color(0xFFFF6B6B);
  static const Color errorDark = Color(0xFFC62828);
  
  /// Advertencia (Warning) - Primary
  static const Color warning = Color(0xFFFFB300);
  static const Color warningLight = Color(0xFFFFD54F);
  static const Color warningDark = Color(0xFFF57C00);
  
  /// Información (Info) - Primary
  static const Color info = Color(0xFF2196F3);
  static const Color infoLight = Color(0xFF64B5F6);
  static const Color infoDark = Color(0xFF1976D2);
  
  // ===== ESCALA DE GRISES =====
  
  /// Fondos y Superficies
  static const Color backgroundPrimary = Color(0xFFFFFFFF);
  static const Color backgroundSecondary = Color(0xFFF5F7FA);
  static const Color backgroundTertiary = Color(0xFFEDF0F4);
  static const Color surface = Color(0xFFFFFFFF);
  // Surface Elevated usa surface con sombra (elevation)
  
  /// Texto
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTertiary = Color(0xFF9CA3AF);
  static const Color textDisabled = Color(0xFFD1D5DB);
  static const Color textInverse = Color(0xFFFFFFFF);
  
  /// Bordes y Divisores
  static const Color borderLight = Color(0xFFE5E7EB);
  static const Color borderMedium = Color(0xFFD1D5DB);
  static const Color borderDark = Color(0xFF9CA3AF);
  
  // ===== COLORES DE GAMIFICACIÓN =====
  
  /// XP y Progreso
  static const Color xpBar = Color(0xFF06A45B);
  static const Color levelBadge = Color(0xFF334A8F);
  
  /// Rachas y Logros
  static const Color streakActive = Color(0xFFFFB300);
  static const Color streakInactive = Color(0xFFD1D5DB);
  static const Color achievementUnlocked = Color(0xFFFFD700);
  static const Color achievementLocked = Color(0xFF9CA3AF);
  
  /// Rankings
  static const Color rankingTop1 = Color(0xFFFFD700); // Dorado
  static const Color rankingTop3 = Color(0xFFC0C0C0); // Plata
  static const Color rankingTop10 = Color(0xFFCD7F32); // Bronce
  
  // ===== COLORES DE PREGUNTAS Y RESPUESTAS =====
  
  /// Respuestas
  static const Color answerCorrect = Color(0xFF06A45B);
  static const Color answerIncorrect = Color(0xFFE53935);
  static const Color answerMarked = Color(0xFFFFB300);
  static const Color answerUnanswered = Color(0xFFE5E7EB);
  
  /// Estados de Pregunta
  static const Color questionCurrent = Color(0xFF334A8F); // Azul principal (borde destacado)
  static const Color questionAnswered = Color(0xFFD1F2EB); // Verde muy claro
  static const Color questionMarkedForReview = Color(0xFFFFF3CD); // Amarillo muy claro
  // Sin responder: Transparente
}
