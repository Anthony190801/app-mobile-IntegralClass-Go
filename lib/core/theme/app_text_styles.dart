/// Estilos de texto según el Design System
/// 
/// Define los estilos tipográficos de la aplicación
/// Basado en docs/DESIGN_SYSTEM.md
/// Fuente principal: Roboto (Material Design default)

import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._(); // Constructor privado
  
  // ===== DISPLAY (Títulos Grandes) =====
  
  /// Display Large: 57px / 64px line height / Bold
  static const TextStyle displayLarge = TextStyle(
    fontSize: 57,
    height: 64 / 57, // line height / font size
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: -0.25,
  );
  
  /// Display Medium: 45px / 52px line height / Bold
  static const TextStyle displayMedium = TextStyle(
    fontSize: 45,
    height: 52 / 45,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: 0,
  );
  
  /// Display Small: 36px / 44px line height / Bold
  static const TextStyle displaySmall = TextStyle(
    fontSize: 36,
    height: 44 / 36,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: 0,
  );
  
  // ===== HEADLINE (Títulos) =====
  
  /// Headline Large: 32px / 40px line height / Bold
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    height: 40 / 32,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    letterSpacing: 0,
  );
  
  /// Headline Medium: 28px / 36px line height / SemiBold
  static const TextStyle headlineMedium = TextStyle(
    fontSize: 28,
    height: 36 / 28,
    fontWeight: FontWeight.w600, // SemiBold
    color: AppColors.textPrimary,
    letterSpacing: 0,
  );
  
  /// Headline Small: 24px / 32px line height / SemiBold
  static const TextStyle headlineSmall = TextStyle(
    fontSize: 24,
    height: 32 / 24,
    fontWeight: FontWeight.w600, // SemiBold
    color: AppColors.textPrimary,
    letterSpacing: 0,
  );
  
  // ===== TITLE (Subtítulos) =====
  
  /// Title Large: 22px / 28px line height / Medium
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    height: 28 / 22,
    fontWeight: FontWeight.w500, // Medium
    color: AppColors.textPrimary,
    letterSpacing: 0,
  );
  
  /// Title Medium: 16px / 24px line height / Medium
  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w500, // Medium
    color: AppColors.textPrimary,
    letterSpacing: 0.15,
  );
  
  /// Title Small: 14px / 20px line height / Medium
  static const TextStyle titleSmall = TextStyle(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w500, // Medium
    color: AppColors.textPrimary,
    letterSpacing: 0.1,
  );
  
  // ===== BODY (Texto Principal) =====
  
  /// Body Large: 16px / 24px line height / Regular
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    letterSpacing: 0.5,
  );
  
  /// Body Medium: 14px / 20px line height / Regular
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    letterSpacing: 0.25,
  );
  
  /// Body Small: 12px / 16px line height / Regular
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    letterSpacing: 0.4,
  );
  
  // ===== LABEL (Etiquetas) =====
  
  /// Label Large: 14px / 20px line height / Medium
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w500, // Medium
    color: AppColors.textPrimary,
    letterSpacing: 0.1,
  );
  
  /// Label Medium: 12px / 16px line height / Medium
  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w500, // Medium
    color: AppColors.textPrimary,
    letterSpacing: 0.5,
  );
  
  /// Label Small: 11px / 16px line height / Medium
  static const TextStyle labelSmall = TextStyle(
    fontSize: 11,
    height: 16 / 11,
    fontWeight: FontWeight.w500, // Medium
    color: AppColors.textPrimary,
    letterSpacing: 0.5,
  );
  
  // ===== VARIANTES DE COLOR =====
  
  /// Body Medium con color secundario
  static TextStyle bodyMediumSecondary = bodyMedium.copyWith(
    color: AppColors.textSecondary,
  );
  
  /// Body Small con color terciario
  static TextStyle bodySmallTertiary = bodySmall.copyWith(
    color: AppColors.textTertiary,
  );
  
  /// Label Medium con color secundario
  static TextStyle labelMediumSecondary = labelMedium.copyWith(
    color: AppColors.textSecondary,
  );
  
  /// Texto deshabilitado
  static TextStyle disabled = bodyMedium.copyWith(
    color: AppColors.textDisabled,
  );
  
  /// Texto inverso (blanco sobre fondo oscuro)
  static TextStyle inverse = bodyMedium.copyWith(
    color: AppColors.textInverse,
  );
}
