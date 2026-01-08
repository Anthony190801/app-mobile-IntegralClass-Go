/// Pantalla de Práctica por Temas
/// 
/// Permite a los estudiantes practicar preguntas por curso y tema

import 'package:flutter/material.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Práctica por Temas'),
      ),
      body: const Center(
        child: Text('Practice Screen - Por implementar'),
      ),
    );
  }
}

