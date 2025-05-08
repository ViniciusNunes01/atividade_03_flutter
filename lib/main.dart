import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/favorites_provider.dart';
import 'package:galeria_onboarding/screens/catalog_screen.dart';
import 'screens/flutter_splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/favorites_screen.dart'; // IMPORTANTE: ADICIONE ESTA LINHA

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoritesProvider(),
      child: const GaleriaOnboardingApp(),
    ),
  );
}

class GaleriaOnboardingApp extends StatelessWidget {
  const GaleriaOnboardingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Galeria Interativa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system,
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/': (context) => const WelcomeScreen(),
        '/catalog': (context) => const CatalogScreen(),
        '/favorites': (context) => const FavoritesScreen(), 
      },
    );
  }
}
