/// Pantalla de Simulacros Virtuales
/// 
/// Permite realizar simulacros tipo examen de admisión

import 'package:flutter/material.dart';

class MockExamScreen extends StatelessWidget {
  const MockExamScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulacros Virtuales'),
      ),
      body: const Center(
        child: Text('Mock Exam Screen - Por implementar'),
      ),
    );
  }
}

