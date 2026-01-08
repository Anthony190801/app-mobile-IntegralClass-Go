/// Pantalla de Notificaciones
/// 
/// Muestra el centro de notificaciones y el dato del día

import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones'),
      ),
      body: const Center(
        child: Text('Notifications Screen - Por implementar'),
      ),
    );
  }
}

