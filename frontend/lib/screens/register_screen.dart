import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 60),
              Image.asset('assets/logo.jpg', height: 40), //
              const SizedBox(height: 40),
              const Text("Create account", 
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold), 
                textAlign: TextAlign.center),
              const SizedBox(height: 8),
              const Text("Sign up to get started.", textAlign: TextAlign.center),
              const SizedBox(height: 32),
              
              // Google Sign-up
              OutlinedButton.icon(
                onPressed: () {}, 
                icon: Image.asset('assets/google_logo.jpg', height: 20), // Placeholder for Google Icon
                label: const Text("Sign up with Google"),
              ),
              
              const SizedBox(height: 20),
              const Row(children: [
                Expanded(child: Divider()), 
                Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Text("or")), 
                Expanded(child: Divider())
              ]),
              const SizedBox(height: 20),
              const TextField(decoration: InputDecoration(labelText: 'Email', suffixText: 'Show')),
              const SizedBox(height: 24),
              const TextField(decoration: InputDecoration(labelText: 'Password', suffixText: 'Show')),
              const SizedBox(height: 24),
              
              ElevatedButton( 
               onPressed: () => Navigator.pushNamed(context, ''),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Your signature blue
                foregroundColor: Colors.white,            // Text and Icon color
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
                child: const Text("Create account", style: TextStyle(color: Colors.black)),
              ),
              
              const SizedBox(height: 20),
              const Text(
                "By creating an account, you agree to the Terms of Service.",
                style: TextStyle(fontSize: 12, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    child: const Text("Sign in")
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}