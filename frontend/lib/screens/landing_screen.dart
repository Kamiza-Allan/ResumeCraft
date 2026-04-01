import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Breakpoint: Treat anything under 850 lots as mobile
    final isMobile = MediaQuery.of(context).size.width < 850;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20.0 : 60.0, 
            vertical: 20.0
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNavBar(context, isMobile),
              const SizedBox(height: 60),
              _buildHeroSection(context, isMobile),
              const SizedBox(height: 80),
              _buildFeatures(isMobile),
              const SizedBox(height: 60),
              _buildFooter(isMobile),
            ],
          ),
        ),
      ),
    );
  }

  // --- Header / Nav ---
  Widget _buildNavBar(BuildContext context, bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(Icons.description, color: Color(0xFF2D62FF), size: 30),
            const SizedBox(width: 10),
            const Text(
              "ResumeCraft",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        if (!isMobile)
          Row(
            children: [
              TextButton(onPressed: () {}, child: const Text("About", style: TextStyle(color: Colors.black))),
              const SizedBox(width: 20),
              TextButton(onPressed: () {}, child: const Text("Features", style: TextStyle(color: Colors.black))),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2D62FF)),
                child: const Text("Sign In", style: TextStyle(color: Colors.white)),
              ),
            ],
          )
        else
          IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
      ],
    );
  }

  // --- Hero Section ---
  Widget _buildHeroSection(BuildContext context, bool isMobile) {
    Widget textContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Build Smarter\nResumes with AI",
          style: TextStyle(
            fontSize: isMobile ? 42 : 64, 
            fontWeight: FontWeight.w900, 
            height: 1.1
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Create and manage your resume seamlessly across web and mobile.",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
        const SizedBox(height: 40),
        Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/register'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2D62FF),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 22),
              ),
              child: const Text("Get Started", style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 22),
                side: const BorderSide(color: Color(0xFF2D62FF)),
              ),
              child: const Text("Try Demo", style: TextStyle(color: Color(0xFF2D62FF))),
            ),
          ],
        ),
      ],
    );

    Widget imageContent = Center(
      child: Image.asset(
        'assets/ai_assistant.png',
        height: isMobile ? 250 : 450,
        errorBuilder: (context, error, stackTrace) => 
            const Icon(Icons.smart_toy, size: 150, color: Color(0xFF2D62FF)),
      ),
    );

    return isMobile 
      ? Column(children: [textContent, const SizedBox(height: 40), imageContent])
      : Row(children: [Expanded(child: textContent), Expanded(child: imageContent)]);
  }

  // --- Features ---
  Widget _buildFeatures(bool isMobile) {
    return Wrap(
      spacing: 40,
      runSpacing: 40,
      children: [
        _featureIcon(Icons.auto_awesome, "AI Builder"),
        _featureIcon(Icons.devices, "Mobile Sync"),
        _featureIcon(Icons.security, "Secure PDF"),
      ],
    );
  }

  Widget _featureIcon(IconData icon, String title) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFF2D62FF).withOpacity(0.1),
          child: Icon(icon, color: const Color(0xFF2D62FF)),
        ),
        const SizedBox(height: 8),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildFooter(bool isMobile) {
    return const Center(
      child: Text("© 2026 ResumeCraft AI. All rights reserved.", style: TextStyle(color: Colors.grey)),
    );
  }
}