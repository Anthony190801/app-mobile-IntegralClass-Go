/// Configuración de la práctica
/// 
/// Parámetros seleccionados por el usuario para iniciar una práctica

enum Course {
  matematica,
  fisica,
  quimica,
  razonamientoVerbal,
  razonamientoMatematico,
}

enum Difficulty {
  facil,
  medio,
  dificil,
}

class PracticeConfig {
  final Course course;
  final String topic;
  final Difficulty difficulty;
  final int questionCount;
  
  PracticeConfig({
    required this.course,
    required this.topic,
    required this.difficulty,
    required this.questionCount,
  });
}

