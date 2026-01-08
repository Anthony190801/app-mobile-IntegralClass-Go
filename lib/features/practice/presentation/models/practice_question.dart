/// Modelo de pregunta para práctica
/// 
/// Representa una pregunta con sus opciones y respuesta correcta

class PracticeQuestion {
  final String id;
  final String question;
  final List<String> options; // Opciones A, B, C, D, E
  final int correctAnswerIndex; // Índice de la respuesta correcta (0-4)
  final String? explanation;
  
  PracticeQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
    this.explanation,
  });
  
  bool isCorrect(int selectedIndex) {
    return selectedIndex == correctAnswerIndex;
  }
}

