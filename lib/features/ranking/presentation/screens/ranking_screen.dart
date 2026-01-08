/// Pantalla de Ranking
/// 
/// Muestra los rankings generales y por curso

import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ranking'),
      ),
      body: const Center(
        child: Text('Ranking Screen - Por implementar'),
      ),
    );
  }
}

