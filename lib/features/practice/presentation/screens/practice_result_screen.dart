/// Pantalla de resultados de práctica
/// 
/// Muestra el resumen de resultados al finalizar una práctica

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../dashboard/presentation/screens/dashboard_screen.dart';
import '../providers/practice_provider.dart';

class PracticeResultScreen extends StatelessWidget {
  const PracticeResultScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultados'),
      ),
      body: Consumer<PracticeProvider>(
        builder: (context, provider, _) {
          final result = provider.result;
          
          if (result == null) {
            return const Center(child: CircularProgressIndicator());
          }
          
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Card de resumen principal
                AppCard.elevated(
                  child: Column(
                    children: [
                      // Porcentaje de aciertos
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _getPercentageColor(result.percentage)
                              .withOpacity(0.1),
                        ),
                        child: Center(
                          child: Text(
                            '${result.percentage.toInt()}%',
                            style: Theme.of(context).textTheme.displaySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: _getPercentageColor(result.percentage),
                            ),
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: AppSpacing.lg),
                      
                      Text(
                        _getPerformanceText(result.percentage),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      const SizedBox(height: AppSpacing.md),
                      
                      Text(
                        'Has completado ${result.totalQuestions} preguntas',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: AppSpacing.lg),
                
                // Estadísticas detalladas
                Row(
                  children: [
                    Expanded(
                      child: _StatCard(
                        icon: Icons.check_circle,
                        label: 'Correctas',
                        value: '${result.correctAnswers}',
                        color: AppColors.success,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: _StatCard(
                        icon: Icons.cancel,
                        label: 'Incorrectas',
                        value: '${result.incorrectAnswers}',
                        color: AppColors.error,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: AppSpacing.lg),
                
                // Detalle por pregunta (opcional, simplificado)
                Text(
                  'Resumen',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                
                const SizedBox(height: AppSpacing.md),
                
                AppCard.standard(
                  child: Column(
                    children: [
                      _ResultRow(
                        label: 'Total de preguntas',
                        value: '${result.totalQuestions}',
                      ),
                      const Divider(),
                      _ResultRow(
                        label: 'Respuestas correctas',
                        value: '${result.correctAnswers}',
                        valueColor: AppColors.success,
                      ),
                      const Divider(),
                      _ResultRow(
                        label: 'Respuestas incorrectas',
                        value: '${result.incorrectAnswers}',
                        valueColor: AppColors.error,
                      ),
                      const Divider(),
                      _ResultRow(
                        label: 'Porcentaje de aciertos',
                        value: '${result.percentage.toStringAsFixed(1)}%',
                        valueColor: _getPercentageColor(result.percentage),
                        isBold: true,
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: AppSpacing.xl),
                
                // Botón para volver al Dashboard
                AppButton(
                  text: 'Volver al Dashboard',
                  onPressed: () {
                    // Limpiar provider y volver al dashboard
                    provider.reset();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (_) => const DashboardScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  type: AppButtonType.primary,
                  isFullWidth: true,
                  icon: Icons.home,
                ),
                
                const SizedBox(height: AppSpacing.md),
                
                // Botón para practicar de nuevo
                AppButton(
                  text: 'Practicar de Nuevo',
                  onPressed: () {
                    provider.reset();
                    Navigator.of(context).pop();
                  },
                  type: AppButtonType.secondary,
                  isFullWidth: true,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  
  Color _getPercentageColor(double percentage) {
    if (percentage >= 80) return AppColors.success;
    if (percentage >= 60) return AppColors.warning;
    return AppColors.error;
  }
  
  String _getPerformanceText(double percentage) {
    if (percentage >= 90) return '¡Excelente!';
    if (percentage >= 80) return '¡Muy bien!';
    if (percentage >= 60) return 'Bien hecho';
    return 'Sigue practicando';
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
    return AppCard.standard(
      child: Column(
        children: [
          Icon(icon, size: 32, color: color),
          const SizedBox(height: AppSpacing.sm),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
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

class _ResultRow extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  final bool isBold;
  
  const _ResultRow({
    required this.label,
    required this.value,
    this.valueColor,
    this.isBold = false,
  });
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: valueColor,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

