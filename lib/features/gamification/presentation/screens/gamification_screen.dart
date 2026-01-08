/// Pantalla de Gamificación y Progreso
/// 
/// Muestra XP, niveles, logros y rachas del usuario

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../providers/gamification_provider.dart';
import '../widgets/level_display_card.dart';
import '../widgets/achievement_card.dart';

class GamificationScreen extends StatelessWidget {
  const GamificationScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gamificación y Progreso'),
        ),
        body: Consumer<GamificationProvider>(
          builder: (context, provider, _) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Card de nivel y progreso
                  LevelDisplayCard(
                    progress: provider.progress,
                  ),
                  
                  const SizedBox(height: AppSpacing.xl),
                  
                  // Estadísticas rápidas
                  Row(
                    children: [
                      Expanded(
                        child: _StatCard(
                          icon: Icons.stars,
                          label: 'XP Total',
                          value: '${provider.progress.totalXp}',
                          color: AppColors.xpBar,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      Expanded(
                        child: _StatCard(
                          icon: Icons.local_fire_department,
                          label: 'Racha',
                          value: '${provider.progress.streakDays} días',
                          color: AppColors.streakActive,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: AppSpacing.xl),
                  
                  // Sección de logros
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Logros',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                          vertical: AppSpacing.xs,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.accentGreen.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '${provider.unlockedAchievements.length}/${provider.achievements.length}',
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: AppColors.accentGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: AppSpacing.md),
                  
                  // Lista de logros desbloqueados
                  if (provider.unlockedAchievements.isNotEmpty) ...[
                    Text(
                      'Desbloqueados',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    ...provider.unlockedAchievements.map(
                      (achievement) => Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                        child: AchievementCard(achievement: achievement),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                  ],
                  
                  // Lista de logros bloqueados
                  if (provider.lockedAchievements.isNotEmpty) ...[
                    Text(
                      'Por Desbloquear',
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    ...provider.lockedAchievements.map(
                      (achievement) => Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                        child: AchievementCard(achievement: achievement),
                      ),
                    ),
                  ],
                  
                  if (provider.achievements.isEmpty)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(AppSpacing.xxxl),
                        child: Column(
                          children: [
                            Icon(
                              Icons.emoji_events_outlined,
                              size: 64,
                              color: AppColors.textTertiary,
                            ),
                            const SizedBox(height: AppSpacing.md),
                            Text(
                              'Aún no hay logros disponibles',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;
  
  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Icon(icon, size: 32, color: color),
          const SizedBox(height: AppSpacing.sm),
          Text(
            value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
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
      ),
    );
  }
}
