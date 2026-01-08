/// Pantalla de Versus (Retos)
/// 
/// Permite crear y participar en retos 1 vs 1

import 'package:flutter/material.dart';

class VersusScreen extends StatelessWidget {
  const VersusScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Versus'),
      ),
      body: const Center(
        child: Text('Versus Screen - Por implementar'),
      ),
    );
  }
}

