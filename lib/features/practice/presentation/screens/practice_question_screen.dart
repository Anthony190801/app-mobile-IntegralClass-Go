/// Pantalla de resolución de preguntas
/// 
/// Muestra la pregunta actual y permite seleccionar respuestas

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';
import '../providers/practice_provider.dart';
import 'practice_result_screen.dart';

class PracticeQuestionScreen extends StatelessWidget {
  const PracticeQuestionScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Consumer<PracticeProvider>(
          builder: (context, provider, _) {
            return Text(
              'Pregunta ${provider.currentQuestionIndex + 1} de ${provider.totalQuestions}',
            );
          },
        ),
      ),
      body: Consumer<PracticeProvider>(
        builder: (context, provider, _) {
          final question = provider.currentQuestion;
          
          if (question == null) {
            return const Center(child: CircularProgressIndicator());
          }
          
          return Column(
            children: [
              // Barra de progreso
              Container(
                width: double.infinity,
                height: 4,
                color: AppColors.backgroundTertiary,
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: (provider.currentQuestionIndex + 1) / provider.totalQuestions,
                  child: Container(
                    color: AppColors.primaryBlue,
                  ),
                ),
              ),
              
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Pregunta
                      AppCard.standard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pregunta ${provider.currentQuestionIndex + 1}',
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                color: AppColors.primaryBlue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: AppSpacing.md),
                            Text(
                              question.question,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: AppSpacing.lg),
                      
                      // Opciones de respuesta
                      Text(
                        'Selecciona tu respuesta:',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      const SizedBox(height: AppSpacing.md),
                      
                      ...List.generate(question.options.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                          child: _AnswerOption(
                            optionLabel: String.fromCharCode(65 + index), // A, B, C, D, E
                            optionText: question.options[index],
                            isSelected: provider.currentSelectedAnswer == index,
                            onTap: () {
                              provider.selectAnswer(index);
                            },
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              
              // Botones de navegación
              Container(
                padding: const EdgeInsets.all(AppSpacing.lg),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Row(
                    children: [
                      if (provider.hasPreviousQuestion)
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: () => provider.previousQuestion(),
                            icon: const Icon(Icons.arrow_back),
                            label: const Text('Anterior'),
                          ),
                        )
                      else
                        const Expanded(child: SizedBox()),
                      
                      if (provider.hasPreviousQuestion && provider.hasNextQuestion)
                        const SizedBox(width: AppSpacing.md),
                      
                      if (provider.hasNextQuestion)
                        Expanded(
                          flex: 2,
                          child: AppButton(
                            text: 'Siguiente',
                            onPressed: provider.currentSelectedAnswer != null
                                ? () => provider.nextQuestion()
                                : null,
                            type: AppButtonType.primary,
                            icon: Icons.arrow_forward,
                          ),
                        )
                      else
                        Expanded(
                          flex: 2,
                          child: AppButton(
                            text: 'Finalizar Práctica',
                            onPressed: provider.currentSelectedAnswer != null
                                ? () {
                                    provider.finishPractice();
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (_) => ChangeNotifierProvider.value(
                                          value: provider,
                                          child: const PracticeResultScreen(),
                                        ),
                                      ),
                                    );
                                  }
                                : null,
                            type: AppButtonType.success,
                            icon: Icons.check_circle,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _AnswerOption extends StatelessWidget {
  final String optionLabel;
  final String optionText;
  final bool isSelected;
  final VoidCallback onTap;
  
  const _AnswerOption({
    required this.optionLabel,
    required this.optionText,
    required this.isSelected,
    required this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryBlue.withOpacity(0.1)
              : AppColors.surface,
          border: Border.all(
            color: isSelected
                ? AppColors.primaryBlue
                : AppColors.borderMedium,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primaryBlue
                    : AppColors.backgroundTertiary,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  optionLabel,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: isSelected
                        ? AppColors.textInverse
                        : AppColors.textSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            Expanded(
              child: Text(
                optionText,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: AppColors.primaryBlue,
              ),
          ],
        ),
      ),
    );
  }
}

