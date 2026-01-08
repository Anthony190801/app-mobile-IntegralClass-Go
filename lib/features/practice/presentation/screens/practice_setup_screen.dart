/// Pantalla de configuración de práctica
/// 
/// Permite al usuario seleccionar curso, tema, dificultad y cantidad de preguntas

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_button.dart';
import '../models/practice_config.dart';
import '../providers/practice_provider.dart';
import 'practice_question_screen.dart';

class PracticeSetupScreen extends StatefulWidget {
  const PracticeSetupScreen({super.key});
  
  @override
  State<PracticeSetupScreen> createState() => _PracticeSetupScreenState();
}

class _PracticeSetupScreenState extends State<PracticeSetupScreen> {
  Course? _selectedCourse;
  String? _selectedTopic;
  Difficulty? _selectedDifficulty;
  int _selectedQuestionCount = 10;
  
  final List<int> _questionCountOptions = [5, 10, 15, 20];
  
  final Map<Course, List<String>> _topicsByCourse = {
    Course.matematica: [
      'Álgebra',
      'Geometría',
      'Trigonometría',
      'Aritmética',
      'Cálculo',
    ],
    Course.fisica: [
      'Mecánica',
      'Termodinámica',
      'Electromagnetismo',
      'Óptica',
      'Física Moderna',
    ],
    Course.quimica: [
      'Química General',
      'Química Orgánica',
      'Química Inorgánica',
      'Química Analítica',
      'Estequiometría',
    ],
    Course.razonamientoVerbal: [
      'Sinónimos y Antónimos',
      'Analogías',
      'Oraciones Incompletas',
      'Comprensión de Lectura',
      'Eliminación de Oraciones',
    ],
    Course.razonamientoMatematico: [
      'Series',
      'Sucesiones',
      'Problemas de Razonamiento',
      'Operadores Matemáticos',
      'Distribuciones',
    ],
  };
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nueva Práctica'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Configura tu práctica',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Selecciona los parámetros para comenzar',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            
            const SizedBox(height: AppSpacing.xl),
            
            // Selección de Curso
            _buildSectionTitle('Curso'),
            const SizedBox(height: AppSpacing.md),
            _buildCourseSelector(),
            
            const SizedBox(height: AppSpacing.lg),
            
            // Selección de Tema
            if (_selectedCourse != null) ...[
              _buildSectionTitle('Tema'),
              const SizedBox(height: AppSpacing.md),
              _buildTopicSelector(),
              const SizedBox(height: AppSpacing.lg),
            ],
            
            // Selección de Dificultad
            _buildSectionTitle('Dificultad'),
            const SizedBox(height: AppSpacing.md),
            _buildDifficultySelector(),
            
            const SizedBox(height: AppSpacing.lg),
            
            // Selección de Cantidad de Preguntas
            _buildSectionTitle('Cantidad de Preguntas'),
            const SizedBox(height: AppSpacing.md),
            _buildQuestionCountSelector(),
            
            const SizedBox(height: AppSpacing.xxxl),
            
            // Botón Iniciar
            AppButton(
              text: 'Iniciar Práctica',
              onPressed: _canStartPractice() ? _startPractice : null,
              type: AppButtonType.primary,
              isFullWidth: true,
              icon: Icons.play_arrow,
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
      ),
    );
  }
  
  Widget _buildCourseSelector() {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: Course.values.map((course) {
        final isSelected = _selectedCourse == course;
        return ChoiceChip(
          label: Text(_getCourseDisplayName(course)),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                _selectedCourse = course;
                _selectedTopic = null; // Reset tema al cambiar curso
              } else {
                _selectedCourse = null;
              }
            });
          },
        );
      }).toList(),
    );
  }
  
  Widget _buildTopicSelector() {
    final topics = _topicsByCourse[_selectedCourse] ?? [];
    
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: topics.map((topic) {
        final isSelected = _selectedTopic == topic;
        return ChoiceChip(
          label: Text(topic),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              _selectedTopic = selected ? topic : null;
            });
          },
        );
      }).toList(),
    );
  }
  
  Widget _buildDifficultySelector() {
    return Row(
      children: [
        Expanded(
          child: _buildDifficultyChip(Difficulty.facil, 'Fácil', AppColors.success),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _buildDifficultyChip(Difficulty.medio, 'Medio', AppColors.warning),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: _buildDifficultyChip(Difficulty.dificil, 'Difícil', AppColors.error),
        ),
      ],
    );
  }
  
  Widget _buildDifficultyChip(Difficulty difficulty, String label, Color color) {
    final isSelected = _selectedDifficulty == difficulty;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        setState(() {
          _selectedDifficulty = selected ? difficulty : null;
        });
      },
      selectedColor: color.withOpacity(0.2),
      checkmarkColor: color,
    );
  }
  
  Widget _buildQuestionCountSelector() {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: _questionCountOptions.map((count) {
        final isSelected = _selectedQuestionCount == count;
        return ChoiceChip(
          label: Text('$count preguntas'),
          selected: isSelected,
          onSelected: (selected) {
            setState(() {
              if (selected) {
                _selectedQuestionCount = count;
              }
            });
          },
        );
      }).toList(),
    );
  }
  
  String _getCourseDisplayName(Course course) {
    switch (course) {
      case Course.matematica:
        return 'Matemática';
      case Course.fisica:
        return 'Física';
      case Course.quimica:
        return 'Química';
      case Course.razonamientoVerbal:
        return 'Razonamiento Verbal';
      case Course.razonamientoMatematico:
        return 'Razonamiento Matemático';
    }
  }
  
  bool _canStartPractice() {
    return _selectedCourse != null &&
        _selectedTopic != null &&
        _selectedDifficulty != null;
  }
  
  void _startPractice() {
    if (!_canStartPractice()) return;
    
    final config = PracticeConfig(
      course: _selectedCourse!,
      topic: _selectedTopic!,
      difficulty: _selectedDifficulty!,
      questionCount: _selectedQuestionCount,
    );
    
    // Obtener o crear provider
    final provider = PracticeProvider();
    provider.startPractice(config);
    
    // Navegar a la pantalla de preguntas
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider.value(
          value: provider,
          child: const PracticeQuestionScreen(),
        ),
      ),
    );
  }
}

