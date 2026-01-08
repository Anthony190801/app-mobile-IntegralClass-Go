/// Botones reutilizables según el Design System
/// 
/// Componentes de botones personalizados que siguen las especificaciones
/// del Design System de IntegralClass Go

import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

/// Tipo de botón según el Design System
enum AppButtonType {
  primary,    // Botón primario (azul principal)
  secondary,  // Botón secundario (outlined)
  text,       // Botón de texto
  success,    // Botón de éxito (verde acento)
}

/// Botón personalizado de la aplicación
/// 
/// Implementa los diferentes estilos de botones según el Design System
class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final bool isLoading;
  final IconData? icon;
  final bool isFullWidth;
  final double? width;
  
  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.isLoading = false,
    this.icon,
    this.isFullWidth = false,
    this.width,
  });
  
  @override
  Widget build(BuildContext context) {
    final Widget content = isLoading
        ? const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.textInverse),
            ),
          )
        : Row(
            mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 20),
                const SizedBox(width: AppSpacing.sm),
              ],
              Text(text),
            ],
          );
    
    final double? buttonWidth = isFullWidth
        ? double.infinity
        : width;
    
    switch (type) {
      case AppButtonType.primary:
        return SizedBox(
          width: buttonWidth,
          child: ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            child: content,
          ),
        );
        
      case AppButtonType.secondary:
        return SizedBox(
          width: buttonWidth,
          child: OutlinedButton(
            onPressed: isLoading ? null : onPressed,
            child: content,
          ),
        );
        
      case AppButtonType.text:
        return SizedBox(
          width: buttonWidth,
          child: TextButton(
            onPressed: isLoading ? null : onPressed,
            child: content,
          ),
        );
        
      case AppButtonType.success:
        return SizedBox(
          width: buttonWidth,
          child: ElevatedButton(
            onPressed: isLoading ? null : onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accentGreen,
              foregroundColor: AppColors.textInverse,
              elevation: 0,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.md,
              ),
              minimumSize: const Size(double.minPositive, 48),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ).copyWith(
              elevation: MaterialStateProperty.resolveWith<double>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) return 0;
                  if (states.contains(MaterialState.pressed)) return 0;
                  if (states.contains(MaterialState.hovered)) return 2;
                  return 0;
                },
              ),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return AppColors.accentGreen.withOpacity(0.5);
                  }
                  return AppColors.accentGreen;
                },
              ),
            ),
            child: content,
          ),
        );
    }
  }
}

