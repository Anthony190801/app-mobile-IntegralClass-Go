/// Punto de entrada de la aplicación IntegralClass Go
/// 
/// Configura el tema de la aplicación y define la estructura base

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/presentation/screens/login_screen.dart';
import 'features/auth/auth_dependencies.dart';
import 'features/auth/presentation/providers/auth_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
      create: (_) => createAuthProvider(),
      child: MaterialApp(
        title: 'IntegralClass Go',
        theme: AppTheme.lightTheme,
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
      ),
    );
  }
}

