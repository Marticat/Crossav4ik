import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme/theme_provider.dart';
import 'app_router.dart';  // Add this import

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp.router(
      title: 'Fitness Tracker',
      theme: ThemeData.light(),  // Replace AppTheme.lightTheme
      darkTheme: ThemeData.dark(),  // Replace AppTheme.darkTheme
      themeMode: themeProvider.themeMode,
      routerConfig: router,  // Replace AppRouter.router
      debugShowCheckedModeBanner: false,
    );
  }
}