/// Card de resumen de progreso
/// 
/// Muestra el nivel, XP, racha y estadísticas del día del usuario

import 'package:flutter/material.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_progress_bar.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../providers/dashboard_provider.dart';

class ProgressSummaryCard extends StatelessWidget {
  final ProgressSummary progressSummary;
  
  const ProgressSummaryCard({
    super.key,
    required this.progressSummary,
  });
  
  @override
  Widget build(BuildContext context) {
    return AppCard.standard(
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
                    'Nivel ${progressSummary.level}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    '${progressSummary.currentXp} / ${progressSummary.xpToNextLevel} XP',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              // Badge de nivel
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'LVL ${progressSummary.level}',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: AppColors.textInverse,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          
          const SizedBox(height: AppSpacing.md),
          
          // Barra de progreso de XP
          AppProgressBar.xp(
            progress: progressSummary.progressPercentage,
            label: 'Progreso al siguiente nivel',
            showPercentage: true,
          ),
          
          const SizedBox(height: AppSpacing.lg),
          
          // Estadísticas del día y racha
          Row(
            children: [
              Expanded(
                child: _StatItem(
                  icon: Icons.quiz_outlined,
                  label: 'Preguntas hoy',
                  value: '${progressSummary.questionsToday}',
                ),
              ),
              Container(
                width: 1,
                height: 40,
                color: AppColors.borderLight,
              ),
              Expanded(
                child: _StatItem(
                  icon: Icons.stars_outlined,
                  label: 'XP ganado',
                  value: '${progressSummary.xpToday}',
                ),
              ),
              Container(
                width: 1,
                height: 40,
                color: AppColors.borderLight,
              ),
              Expanded(
                child: _StatItem(
                  icon: Icons.local_fire_department,
                  label: 'Racha',
                  value: '${progressSummary.streakDays} días',
                  iconColor: AppColors.streakActive,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color? iconColor;
  
  const _StatItem({
    required this.icon,
    required this.label,
    required this.value,
    this.iconColor,
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: iconColor ?? AppColors.primaryBlue,
          size: 24,
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

