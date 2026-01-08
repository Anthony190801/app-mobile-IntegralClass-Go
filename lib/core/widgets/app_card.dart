/// Card reutilizable según el Design System
/// 
/// Componente de card personalizado que sigue las especificaciones
/// del Design System de IntegralClass Go

import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

/// Card personalizado de la aplicación
/// 
/// Soporta dos variantes: estándar y elevada (interactiva)
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool isElevated;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Border? border;
  
  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.isElevated = false,
    this.onTap,
    this.backgroundColor,
    this.border,
  });
  
  /// Card estándar (elevation 2)
  const AppCard.standard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.backgroundColor,
    this.border,
  }) : isElevated = false;
  
  /// Card elevada/interactiva (elevation 4)
  const AppCard.elevated({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.onTap,
    this.backgroundColor,
    this.border,
  }) : isElevated = true;
  
  @override
  Widget build(BuildContext context) {
    final Widget cardContent = Container(
      padding: padding ?? const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: border,
        boxShadow: isElevated
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ]
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: child,
    );
    
    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: cardContent,
      );
    }
    
    return cardContent;
  }
}

