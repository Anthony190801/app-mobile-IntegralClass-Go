/// Provider de práctica
/// 
/// Gestiona el estado de la práctica: configuración, preguntas y resultados

import 'package:flutter/foundation.dart';
import '../models/practice_config.dart';
import '../models/practice_question.dart';
import '../models/practice_result.dart';

class PracticeProvider extends ChangeNotifier {
  PracticeConfig? _config;
  List<PracticeQuestion> _questions = [];
  int _currentQuestionIndex = 0;
  Map<int, int> _answers = {}; // preguntaIndex -> opcionSeleccionada
  PracticeResult? _result;
  
  PracticeConfig? get config => _config;
  List<PracticeQuestion> get questions => _questions;
  int get currentQuestionIndex => _currentQuestionIndex;
  PracticeQuestion? get currentQuestion => 
      _currentQuestionIndex < _questions.length 
          ? _questions[_currentQuestionIndex] 
          : null;
  int get totalQuestions => _questions.length;
  bool get hasNextQuestion => _currentQuestionIndex < _questions.length - 1;
  bool get hasPreviousQuestion => _currentQuestionIndex > 0;
  int? get currentSelectedAnswer => _answers[_currentQuestionIndex];
  PracticeResult? get result => _result;
  
  /// Inicia una nueva práctica con la configuración dada
  void startPractice(PracticeConfig config) {
    _config = config;
    _currentQuestionIndex = 0;
    _answers.clear();
    _result = null;
    
    // Generar preguntas mock según la configuración
    _questions = _generateMockQuestions(
      course: config.course,
      difficulty: config.difficulty,
      count: config.questionCount,
    );
    
    notifyListeners();
  }
  
  /// Selecciona una respuesta para la pregunta actual
  void selectAnswer(int answerIndex) {
    _answers[_currentQuestionIndex] = answerIndex;
    notifyListeners();
  }
  
  /// Navega a la siguiente pregunta
  void nextQuestion() {
    if (hasNextQuestion) {
      _currentQuestionIndex++;
      notifyListeners();
    }
  }
  
  /// Navega a la pregunta anterior
  void previousQuestion() {
    if (hasPreviousQuestion) {
      _currentQuestionIndex--;
      notifyListeners();
    }
  }
  
  /// Finaliza la práctica y calcula resultados
  void finishPractice() {
    final questionResults = <QuestionResult>[];
    int correctCount = 0;
    
    for (int i = 0; i < _questions.length; i++) {
      final question = _questions[i];
      final selectedIndex = _answers[i];
      
      if (selectedIndex != null) {
        final isCorrect = question.isCorrect(selectedIndex);
        if (isCorrect) correctCount++;
        
        questionResults.add(QuestionResult(
          questionId: question.id,
          selectedAnswerIndex: selectedIndex,
          correctAnswerIndex: question.correctAnswerIndex,
          isCorrect: isCorrect,
        ));
      }
    }
    
    _result = PracticeResult(
      totalQuestions: _questions.length,
      correctAnswers: correctCount,
      incorrectAnswers: _questions.length - correctCount,
      questionResults: questionResults,
    );
    
    notifyListeners();
  }
  
  /// Resetea el estado para comenzar una nueva práctica
  void reset() {
    _config = null;
    _questions.clear();
    _currentQuestionIndex = 0;
    _answers.clear();
    _result = null;
    notifyListeners();
  }
  
  /// Genera preguntas mock según los parámetros
  List<PracticeQuestion> _generateMockQuestions({
    required Course course,
    required Difficulty difficulty,
    required int count,
  }) {
    final questions = <PracticeQuestion>[];
    final courseName = _getCourseName(course);
    
    for (int i = 0; i < count; i++) {
      questions.add(PracticeQuestion(
        id: 'q${i + 1}',
        question: '¿Cuál es la respuesta correcta a la pregunta ${i + 1} sobre $courseName? Esta es una pregunta de ejemplo para demostrar el flujo de práctica.',
        options: [
          'Opción A - Primera alternativa',
          'Opción B - Segunda alternativa',
          'Opción C - Tercera alternativa (Correcta)',
          'Opción D - Cuarta alternativa',
          'Opción E - Quinta alternativa',
        ],
        correctAnswerIndex: 2, // Opción C es correcta por defecto
        explanation: 'Esta es la explicación de la respuesta correcta para la pregunta ${i + 1}.',
      ));
    }
    
    return questions;
  }
  
  String _getCourseName(Course course) {
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
}

