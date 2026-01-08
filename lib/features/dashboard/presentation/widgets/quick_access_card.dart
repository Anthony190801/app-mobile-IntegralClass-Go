/// Card de acceso rápido a módulos
/// 
/// Widget reutilizable para mostrar acceso rápido a funcionalidades

import 'package:flutter/material.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';

/// Opciones de acceso rápido disponibles
enum QuickAccessType {
  practice,
  dailyEvaluation,
  mockExam,
  ranking,
  versus,
  forum,
}

extension QuickAccessTypeExtension on QuickAccessType {
  String get title {
    switch (this) {
      case QuickAccessType.practice:
        return 'Práctica';
      case QuickAccessType.dailyEvaluation:
        return 'Evaluación Diaria';
      case QuickAccessType.mockExam:
        return 'Simulacro';
      case QuickAccessType.ranking:
        return 'Ranking';
      case QuickAccessType.versus:
        return 'Versus';
      case QuickAccessType.forum:
        return 'Foro';
    }
  }
  
  IconData get icon {
    switch (this) {
      case QuickAccessType.practice:
        return Icons.quiz_outlined;
      case QuickAccessType.dailyEvaluation:
        return Icons.today_outlined;
      case QuickAccessType.mockExam:
        return Icons.assignment_outlined;
      case QuickAccessType.ranking:
        return Icons.emoji_events_outlined;
      case QuickAccessType.versus:
        return Icons.people_outline;
      case QuickAccessType.forum:
        return Icons.forum_outlined;
    }
  }
  
  Color get color {
    switch (this) {
      case QuickAccessType.practice:
        return AppColors.primaryBlue;
      case QuickAccessType.dailyEvaluation:
        return AppColors.accentGreen;
      case QuickAccessType.mockExam:
        return AppColors.secondaryBlue;
      case QuickAccessType.ranking:
        return AppColors.warning;
      case QuickAccessType.versus:
        return AppColors.info;
      case QuickAccessType.forum:
        return AppColors.primaryBlue;
    }
  }
}

class QuickAccessCard extends StatelessWidget {
  final QuickAccessType type;
  final VoidCallback? onTap;
  final String? badge;
  
  const QuickAccessCard({
    super.key,
    required this.type,
    this.onTap,
    this.badge,
  });
  
  @override
  Widget build(BuildContext context) {
    return AppCard.elevated(
      onTap: onTap,
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(AppSpacing.md),
                decoration: BoxDecoration(
                  color: type.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  type.icon,
                  size: 32,
                  color: type.color,
                ),
              ),
              if (badge != null)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.error,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      badge!,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.textInverse,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            type.title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

