import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const ResumeCraftApp());
}

class ResumeCraftApp extends StatelessWidget {
  const ResumeCraftApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ResumeCraft',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // The signature blue from your UI
        primaryColor: const Color(0xFF2D62FF), 
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2D62FF),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.grey[50],
        ),
      ),
      home: const LoginScreen(), // We'll build this next
    );
  }
}