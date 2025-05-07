import 'package:flutter/material.dart';
import 'screens/flutter_splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const GaleriaOnboardingApp());
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
      initialRoute: '/',
      routes: {
        '/': (context) => const FlutterSplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/welcome': (context) => const WelcomeScreen(),
      },
    );
  }
}
