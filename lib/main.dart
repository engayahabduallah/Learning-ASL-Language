import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_signup_screen.dart';
import 'screens/signup_form_screen.dart';
import 'screens/home_screen.dart';
import 'screens/about_screen.dart';      
import 'screens/guidance_screen.dart';   
import 'screens/support_screen.dart';    
import 'services/progress_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProgressService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Signly App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0D47A1), 
          foregroundColor: Colors.white,
        ),
      ),
    
      initialRoute: '/', 
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginSignupScreen(),
        '/signup': (context) => const SignupFormScreen(),
        '/home': (context) => const HomeScreen(),
        '/about': (context) => const AboutScreen(),
        '/guidance': (context) => const GuidanceScreen(),
        '/support': (context) => const SupportScreen(),
        '/settings': (context) => const SettingsScreen(), 
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: const Center(
        child: Text("Settings page content will be added here.", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}





