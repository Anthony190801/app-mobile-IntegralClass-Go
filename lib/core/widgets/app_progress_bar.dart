/// Barra de progreso personalizada según el Design System
/// 
/// Usada para mostrar XP, niveles y otros tipos de progreso

import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

/// Barra de progreso personalizada
/// 
/// Muestra una barra de progreso con el estilo del Design System
class AppProgressBar extends StatelessWidget {
  final double progress; // 0.0 a 1.0
  final double height;
  final Color? backgroundColor;
  final Color? progressColor;
  final String? label;
  final bool showPercentage;
  
  const AppProgressBar({
    super.key,
    required this.progress,
    this.height = 8.0,
    this.backgroundColor,
    this.progressColor,
    this.label,
    this.showPercentage = false,
  });
  
  /// Barra de progreso para XP (verde)
  const AppProgressBar.xp({
    super.key,
    required this.progress,
    this.height = 8.0,
    this.label,
    this.showPercentage = false,
  }) : backgroundColor = AppColors.backgroundTertiary,
       progressColor = AppColors.xpBar;
  
  /// Barra de progreso estándar (azul)
  const AppProgressBar.standard({
    super.key,
    required this.progress,
    this.height = 8.0,
    this.label,
    this.showPercentage = false,
  }) : backgroundColor = AppColors.backgroundTertiary,
       progressColor = AppColors.primaryBlue;
  
  @override
  Widget build(BuildContext context) {
    final clampedProgress = progress.clamp(0.0, 1.0);
    final percentage = (clampedProgress * 100).toInt();
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null || showPercentage) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (label != null)
                Text(
                  label!,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              if (showPercentage)
                Text(
                  '$percentage%',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.xs),
        ],
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: clampedProgress,
            minHeight: height,
            backgroundColor: backgroundColor ?? AppColors.backgroundTertiary,
            valueColor: AlwaysStoppedAnimation<Color>(
              progressColor ?? AppColors.primaryBlue,
            ),
          ),
        ),
      ],
    );
  }
}

