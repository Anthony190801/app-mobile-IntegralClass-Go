/// Card de logro/badge
/// 
/// Muestra un logro con su estado (bloqueado/desbloqueado)

import 'package:flutter/material.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../models/achievement.dart';

class AchievementCard extends StatelessWidget {
  final Achievement achievement;
  
  const AchievementCard({
    super.key,
    required this.achievement,
  });
  
  @override
  Widget build(BuildContext context) {
    return AppCard.standard(
      child: Row(
        children: [
          // Ícono del logro
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: achievement.isUnlocked
                  ? AppColors.achievementUnlocked.withOpacity(0.2)
                  : AppColors.achievementLocked.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              achievement.icon,
              color: achievement.isUnlocked
                  ? AppColors.achievementUnlocked
                  : AppColors.achievementLocked,
              size: 32,
            ),
          ),
          
          const SizedBox(width: AppSpacing.md),
          
          // Información del logro
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        achievement.name,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: achievement.isUnlocked
                              ? AppColors.textPrimary
                              : AppColors.textSecondary,
                        ),
                      ),
                    ),
                    if (achievement.isUnlocked)
                      const Icon(
                        Icons.check_circle,
                        color: AppColors.success,
                        size: 20,
                      ),
                  ],
                ),
                const SizedBox(height: AppSpacing.xs),
                Text(
                  achievement.description,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: achievement.isUnlocked
                        ? AppColors.textSecondary
                        : AppColors.textTertiary,
                  ),
                ),
                if (achievement.isUnlocked && achievement.unlockedAt != null)
                  Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.xs),
                    child: Text(
                      'Desbloqueado: ${_formatDate(achievement.unlockedAt!)}',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.textTertiary,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  String _formatDate(DateTime date) {
    final day = date.day;
    final month = date.month;
    final year = date.year;
    return '$day/$month/$year';
  }
}

