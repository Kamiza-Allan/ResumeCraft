import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Logo from your design
            Image.asset('assets/logo.jpg', height: 40), 
            const SizedBox(height: 40),
            const Text("Sign in", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            const SizedBox(height: 8),
            const Text("Welcome back! Sign in to your account.", textAlign: TextAlign.center),
            const SizedBox(height: 32),
            
            // Google Sign-in Button
            OutlinedButton.icon(
              onPressed: () {}, 
              icon: Image.asset('assets/google_logo.jpg', height: 20),
              label: const Text("Sign in with Google"),
            ),
            
            const SizedBox(height: 20),
            const Row(children: [Expanded(child: Divider()), Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text("or")), Expanded(child: Divider())]),
            const SizedBox(height: 20),

            const TextField(decoration: InputDecoration(labelText: 'Email')),
            const SizedBox(height: 16),
            const TextField(obscureText: true, decoration: InputDecoration(labelText: 'Password', suffixText: 'Show')),
            const SizedBox(height: 24),
            
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/dashboard')/* Call AuthService.login */ ,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Your signature blue
                foregroundColor: Colors.white,            // Text and Icon color
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Sign in", style: TextStyle(color: Colors.white)),
            ),
            
            TextButton(onPressed: () {}, child: const Text("Forgot password?")),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("New to ResumeCraft?"),
                TextButton(onPressed: () => Navigator.pushNamed(context, '/register'), child: const Text("Create account")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}