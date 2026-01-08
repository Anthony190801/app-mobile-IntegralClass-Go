/// Providers globales de la aplicación
/// 
/// Configuración centralizada de providers compartidos entre módulos

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../features/auth/auth_dependencies.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/gamification/presentation/providers/gamification_provider.dart';

/// Lista de providers globales
List<ChangeNotifierProvider> getAppProviders(Widget child) {
  return [
    ChangeNotifierProvider<AuthProvider>(
      create: (_) => createAuthProvider(),
    ),
    ChangeNotifierProvider<GamificationProvider>(
      create: (_) => GamificationProvider(),
    ),
  ];
}

/// MultiProvider con todos los providers globales
Widget withAppProviders(Widget child) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider<AuthProvider>(
        create: (_) => createAuthProvider(),
      ),
      ChangeNotifierProvider<GamificationProvider>(
        create: (_) => GamificationProvider(),
      ),
    ],
    child: child,
  );
}

