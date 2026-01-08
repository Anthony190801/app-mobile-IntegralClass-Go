/// Card de visualización de nivel y XP
/// 
/// Muestra el nivel actual, XP y barra de progreso

import 'package:flutter/material.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_progress_bar.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../models/user_progress.dart';

class LevelDisplayCard extends StatelessWidget {
  final UserProgress progress;
  
  const LevelDisplayCard({
    super.key,
    required this.progress,
  });
  
  @override
  Widget build(BuildContext context) {
    return AppCard.elevated(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header con nivel
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nivel ${progress.level}',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    '${progress.totalXp} XP totales',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              // Badge de nivel grande
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.md,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Text(
                      'LVL',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.textInverse,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      '${progress.level}',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: AppColors.textInverse,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: AppSpacing.lg),
          
          // Barra de progreso de XP
          AppProgressBar.xp(
            progress: progress.progressToNextLevel,
            height: 12,
            label: 'Progreso al Nivel ${progress.level + 1}',
            showPercentage: true,
          ),
          
          const SizedBox(height: AppSpacing.sm),
          
          // XP actual / XP necesario
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${progress.xpInCurrentLevel} XP',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              Text(
                '${progress.xpForNextLevel} XP para siguiente nivel',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

