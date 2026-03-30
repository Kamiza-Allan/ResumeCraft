import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/resume_editor_screen.dart';
import 'screens/landing_screen.dart';
import 'screens/register_screen.dart';

void main() {
  runApp(const ResumeCraftApp());
}

class ResumeCraftApp extends StatelessWidget {
  const ResumeCraftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ResumeCraft',
      initialRoute: '/', // Start at the Landing Page
      routes: {
        '/': (context) => const LandingScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/editor': (context) => const ResumeEditorScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}