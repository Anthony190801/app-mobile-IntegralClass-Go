/// Pantalla de Comunidad Académica (Foro)
/// 
/// Muestra el foro de discusión de la comunidad

import 'package:flutter/material.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Foro'),
      ),
      body: const Center(
        child: Text('Forum Screen - Por implementar'),
      ),
    );
  }
}

