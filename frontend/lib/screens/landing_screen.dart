import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine if the screen is mobile-sized
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          // Adjusted padding to use 20 lots on mobile, 40 lots on desktop
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20.0 : 40.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNavBar(context, isMobile),
              SizedBox(height: isMobile ? 40 : 80),
              _buildHeroSection(context, isMobile),
              SizedBox(height: isMobile ? 60 : 100),
              _buildFeaturesAndHowItWorks(isMobile),
              SizedBox(height: isMobile ? 40 : 80),
              _buildFooter(isMobile),
            ],
          ),
        ),
      ),
    );
  }

  // 1. Responsive Navigation Bar
  Widget _buildNavBar(BuildContext context, bool isMobile) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "⚙️ ResumeCraft", 
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)
        ),
        // If mobile, only show the "Sign in" button to save space
        if (isMobile)
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/login'), 
            child: const Text("Sign in", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
          )
        else
          Row(
            children: [
              TextButton(onPressed: () {}, child: const Text("About", style: TextStyle(color: Colors.black))),
              const SizedBox(width: 20),
              TextButton(onPressed: () {}, child: const Text("Features", style: TextStyle(color: Colors.black))),
              const SizedBox(width: 20),
              TextButton(onPressed: () {}, child: const Text("Pricing", style: TextStyle(color: Colors.black))),
              const SizedBox(width: 20),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/login'), 
                child: const Text("Sign in", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
              ),
            ],
          )
      ],
    );
  }

  // 2. Responsive Hero Section
  Widget _buildHeroSection(BuildContext context, bool isMobile) {
    Widget textContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Build Smarter\nResumes with AI",
          // Font size drops to 40 lots on mobile
          style: TextStyle(fontSize: isMobile ? 40 : 56, fontWeight: FontWeight.w900, height: 1.1),
        ),
        const SizedBox(height: 20),
        Text(
          "Create and manage your resume seamlessly across web and mobile.",
          style: TextStyle(fontSize: isMobile ? 16 : 18, color: Colors.grey),
        ),
        const SizedBox(height: 30),
        // Wrap allows buttons to flow to the next line if they run out of space
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/register'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              ),
              child: const Text("Get Started", style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Try Demo", style: TextStyle(color: Colors.blue, fontSize: 16)),
            ),
          ],
        ),
      ],
    );

    // Replaced the missing Image.asset with a built-in Icon to stop the red error box
    Widget imageContent = const Center(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Icon(Icons.smart_toy, size: 120, color: Colors.blue),
      ),
    );

    return isMobile
        ? Column(children: [textContent, const SizedBox(height: 40), imageContent])
        : Row(children: [Expanded(flex: 1, child: textContent), Expanded(flex: 1, child: imageContent)]);
  }

  // 3. Responsive Features Section
  Widget _buildFeaturesAndHowItWorks(bool isMobile) {
    Widget featuresColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Features", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        const SizedBox(height: 30),
        _buildFeatureItem(Icons.edit_document, "AI Realtime Builder", "Stand out with AI generated suggestions."),
        _buildFeatureItem(Icons.devices, "Cross Platform Sync", "Shape and edit your resume anywhere."),
        _buildFeatureItem(Icons.branding_watermark, "Custom Branding", "Structure your design to fit your style."),
      ],
    );

    Widget howItWorksColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("How It Works", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHowItWorksItem(Icons.input, "Input"),
            const Icon(Icons.arrow_forward, color: Colors.grey),
            _buildHowItWorksItem(Icons.auto_awesome, "AI Enhance"),
          ],
        ),
        const SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHowItWorksItem(Icons.dashboard_customize, "Template"),
            const Icon(Icons.arrow_forward, color: Colors.grey),
            _buildHowItWorksItem(Icons.upload, "Export"),
          ],
        ),
      ],
    );

    return isMobile
        ? Column(children: [featuresColumn, const SizedBox(height: 60), howItWorksColumn])
        : Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(child: featuresColumn),
            Expanded(child: howItWorksColumn),
          ]);
  }

  // 4. Helper Methods remain the same
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

  // 5. Responsive Footer Section
  Widget _buildFooter(bool isMobile) {
    return Column(
      children: [
        const Divider(),
        const SizedBox(height: 40),
        isMobile
            ? Column(
                children: [
                  const Text("“Got hired in 2 weeks thanks to ResumeCraft AI.”\n4.0/5 user rating",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600), textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Trusted by: ", style: TextStyle(color: Colors.grey)),
                      const SizedBox(width: 20),
                      Icon(Icons.business, color: Colors.grey.shade400, size: 40),
                      const SizedBox(width: 20),
                      Icon(Icons.computer, color: Colors.grey.shade400, size: 40),
                    ],
                  )
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("“Got hired in 2 weeks thanks to ResumeCraft AI.”\n4.0/5 user rating",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  Row(
                    children: [
                      const Text("Trusted by: ", style: TextStyle(color: Colors.grey)),
                      const SizedBox(width: 20),
                      Icon(Icons.business, color: Colors.grey.shade400, size: 40),
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