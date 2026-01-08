/// Resultado de una práctica completada

class PracticeResult {
  final int totalQuestions;
  final int correctAnswers;
  final int incorrectAnswers;
  final List<QuestionResult> questionResults;
  
  PracticeResult({
    required this.totalQuestions,
    required this.correctAnswers,
    required this.incorrectAnswers,
    required this.questionResults,
  });
  
  double get percentage => totalQuestions > 0
      ? (correctAnswers / totalQuestions) * 100
      : 0.0;
}

class QuestionResult {
  final String questionId;
  final int selectedAnswerIndex;
  final int correctAnswerIndex;
  final bool isCorrect;
  
  QuestionResult({
    required this.questionId,
    required this.selectedAnswerIndex,
    required this.correctAnswerIndex,
    required this.isCorrect,
  });
}

