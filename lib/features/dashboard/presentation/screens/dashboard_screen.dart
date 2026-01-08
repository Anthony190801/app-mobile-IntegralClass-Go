/// Pantalla principal del Dashboard
/// 
/// Muestra el resumen de progreso del usuario y acceso rápido a funcionalidades

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../../../practice/presentation/screens/practice_screen.dart';
import '../../../daily_evaluation/presentation/screens/daily_evaluation_screen.dart';
import '../../../mock_exam/presentation/screens/mock_exam_screen.dart';
import '../../../ranking/presentation/screens/ranking_screen.dart';
import '../../presentation/providers/dashboard_provider.dart';
import '../../presentation/widgets/progress_summary_card.dart';
import '../../presentation/widgets/quick_access_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DashboardProvider(),
        ),
      ],
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 120,
                floating: true,
                pinned: true,
                backgroundColor: AppColors.primaryBlue,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    'IntegralClass Go',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.textInverse,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  titlePadding: const EdgeInsets.only(
                    left: AppSpacing.lg,
                    bottom: 16,
                  ),
                ),
                actions: [
                  // Avatar del usuario
                  Consumer<AuthProvider>(
                    builder: (context, authProvider, _) {
                      final user = authProvider.user;
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                        ),
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: AppColors.accentGreen,
                            child: user != null
                                ? Text(
                                    user.name.isNotEmpty
                                        ? user.name[0].toUpperCase()
                                        : 'U',
                                    style: const TextStyle(
                                      color: AppColors.textInverse,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                : const Icon(
                                    Icons.person,
                                    color: AppColors.textInverse,
                                  ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ];
          },
          body: Consumer<DashboardProvider>(
            builder: (context, dashboardProvider, _) {
              return RefreshIndicator(
                onRefresh: () async {
                  // TODO: Recargar datos del dashboard
                  await Future.delayed(const Duration(seconds: 1));
                },
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Card de resumen de progreso
                      ProgressSummaryCard(
                        progressSummary: dashboardProvider.progressSummary,
                      ),
                      
                      const SizedBox(height: AppSpacing.lg),
                      
                      // Título de accesos rápidos
                      Text(
                        'Accesos Rápidos',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      
                      const SizedBox(height: AppSpacing.md),
                      
                      // Grid de accesos rápidos
                      GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: AppSpacing.md,
                        mainAxisSpacing: AppSpacing.md,
                        childAspectRatio: 1.1,
                        children: [
                          QuickAccessCard(
                            type: QuickAccessType.practice,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const PracticeScreen(),
                                ),
                              );
                            },
                          ),
                          QuickAccessCard(
                            type: QuickAccessType.dailyEvaluation,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const DailyEvaluationScreen(),
                                ),
                              );
                            },
                            badge: 'NUEVO',
                          ),
                          QuickAccessCard(
                            type: QuickAccessType.mockExam,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const MockExamScreen(),
                                ),
                              );
                            },
                          ),
                          QuickAccessCard(
                            type: QuickAccessType.ranking,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const RankingScreen(),
                                ),
                              );
                            },
                          ),
                          QuickAccessCard(
                            type: QuickAccessType.versus,
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Próximamente: Versus'),
                                ),
                              );
                            },
                          ),
                          QuickAccessCard(
                            type: QuickAccessType.forum,
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Próximamente: Foro'),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
