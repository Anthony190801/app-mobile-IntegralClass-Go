/// Pantalla principal de Práctica por Temas
/// 
/// Pantalla de entrada que redirige a la configuración de práctica

import 'package:flutter/material.dart';
import 'practice_setup_screen.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    // Redirigir directamente a la pantalla de configuración
    // Esta pantalla puede ser útil si en el futuro se quiere mostrar
    // historial o prácticas recientes antes de iniciar una nueva
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const PracticeSetupScreen(),
        ),
      );
    });
    
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

