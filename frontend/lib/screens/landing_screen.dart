import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // We use a Scaffold with a white background to match your design
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNavBar(context),
              const SizedBox(height: 80),
              _buildHeroSection(context),
              const SizedBox(height: 100),
              _buildFeaturesAndHowItWorks(),
              const SizedBox(height: 80),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  // 1. Navigation Bar
  Widget _buildNavBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Using text for the logo right now, but you can swap to Image.asset later
        const Text(
          "ResumeCraft", 
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)
        ),
        Row(
          children: [
            TextButton(onPressed: () {}, child: const Text("About", style: TextStyle(color: Colors.black))),
            const SizedBox(width: 20),
            TextButton(onPressed: () {}, child: const Text("Features", style: TextStyle(color: Colors.black))),
            const SizedBox(width: 20),
            TextButton(onPressed: () {}, child: const Text("Pricing", style: TextStyle(color: Colors.black))),
            const SizedBox(width: 20),
            // The Sign In button that routes to your LoginScreen
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/login'), 
              child: const Text("Sign in", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
            ),
          ],
        )
      ],
    );
  }

  // 2. Hero Section
  Widget _buildHeroSection(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Build Smarter\nResumes with AI", // Matches the bold header
                style: TextStyle(fontSize: 56, fontWeight: FontWeight.w900, height: 1.1),
              ),
              const SizedBox(height: 20),
              const Text(
                "Create and manage your resume seamlessly across web and mobile.",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, '/register'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                    ),
                    child: const Text("Get Started", style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Try Demo", style: TextStyle(color: Colors.blue, fontSize: 16)),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Image.asset('assets/ai_assistant.png'), // Placeholder for the hero illustration
        ),
      ],
    );
  }

  // 3. Features Split Section
  Widget _buildFeaturesAndHowItWorks() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Features Column
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Features", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              _buildFeatureItem(Icons.edit_document, "AI Realtime Builder", "Stand out with AI generated suggestions."),
              _buildFeatureItem(Icons.devices, "Cross Platform Sync", "Shape and edit your resume anywhere."),
              _buildFeatureItem(Icons.branding_watermark, "Custom Branding", "Structure your design to fit your style."),
            ],
          ),
        ),
        // How It Works Column
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("How It Works", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildHowItWorksItem(Icons.input, "Input"),
                  const Icon(Icons.arrow_forward, color: Colors.grey),
                  _buildHowItWorksItem(Icons.auto_awesome, "AI Enhancement"),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildHowItWorksItem(Icons.dashboard_customize, "Template selection"),
                  const Icon(Icons.arrow_forward, color: Colors.grey),
                  _buildHowItWorksItem(Icons.upload, "Export & Share"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Helper widget for Feature List
  Widget _buildFeatureItem(IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, color: Colors.blue),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Helper widget for How It Works grid
  Widget _buildHowItWorksItem(IconData icon, String title) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
          child: Icon(icon, color: Colors.blue, size: 32),
        ),
        const SizedBox(height: 12),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }

  // 4. Footer Section
  Widget _buildFooter() {
    return Column(
      children: [
        const Divider(),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "“Got hired in 2 weeks thanks to ResumeCraft AI.”\n4.0/5 user rating", 
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)
            ),
            Row(
              children: [
                const Text("Trusted by: ", style: TextStyle(color: Colors.grey)),
                const SizedBox(width: 20),
                Icon(Icons.business, color: Colors.grey.shade400, size: 40), // Placeholder for Nike/Google logos
                const SizedBox(width: 20),
                Icon(Icons.computer, color: Colors.grey.shade400, size: 40),
              ],
            )
          ],
        ),
      ],
    );
  }
}