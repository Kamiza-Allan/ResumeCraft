import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Sidebar Navigation
          NavigationRail(
            selectedIndex: 0,
            labelType: NavigationRailLabelType.all,
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Image.asset('assets/logo_small.png', height: 30),
            ),
            destinations: const [
              NavigationRailDestination(icon: Icon(Icons.home_outlined), label: Text('Home')),
              NavigationRailDestination(icon: Icon(Icons.description_outlined), label: Text('Resumes')),
              NavigationRailDestination(icon: Icon(Icons.work_outline), label: Text('Jobs')),
              NavigationRailDestination(icon: Icon(Icons.person_outline), label: Text('Account')),
            ],
            onDestinationSelected: (index) {},
          ),
          const VerticalDivider(thickness: 1, width: 1),
          
          // Main Content Area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: Icon(Icons.search),
                  ),
                  const Text("Welcome,", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  const Text("Dav A Hunter", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text("Build your resume with the help of AI."),
                  const SizedBox(height: 24),
                  
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16)),
                    child: const Text("New Resume", style: TextStyle(color: Colors.white)),
                  ),
                  
                  const SizedBox(height: 40),
                  const Text("Recent Resumes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const Divider(),
                  
                  // Resume List Item
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text("Dav A Hunter", style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text("Last modified 2 days ago"),
                    trailing: Wrap(
                      spacing: 12,
                      children: [
                        TextButton(onPressed: () {}, child: const Text("Edit")),
                        TextButton(onPressed: () {}, child: const Text("Duplicate")),
                        TextButton(onPressed: () {}, child: const Text("Delete", style: TextStyle(color: Colors.red))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // AI Assistant Guidance Panel (Right side)
          Container(
            width: 300,
            color: const Color(0xFFF8FAFF),
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Image.asset('assets/ai_assistant.png'), // Illustration from 4.jpg
                const SizedBox(height: 20),
                const Text("AI Assistant Guidance", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                const Text(
                  "Get suggestions for improving your resume as you work on it.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}