/// Punto de entrada de la aplicación IntegralClass Go
/// 
/// Configura el tema de la aplicación y define la estructura base

import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'core/providers/app_providers.dart';
import 'features/auth/presentation/screens/login_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return withAppProviders(
      MaterialApp(
        title: 'IntegralClass Go',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
      ),
    );
  }
}

