import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFF),
      appBar: isMobile 
          ? AppBar(title: const Text("Dashboard"), backgroundColor: Colors.white, foregroundColor: Colors.black, elevation: 0) 
          : null,
      drawer: isMobile ? Drawer(child: _buildSidebarContent()) : null,
      body: Row(
        children: [
          if (!isMobile) SizedBox(width: 260, child: _buildSidebarContent()),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(isMobile ? 20 : 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 40),
                  _buildRecentResumes(isMobile),
                  if (isMobile) ...[
                    const SizedBox(height: 40),
                    _buildAIPanel(),
                  ]
                ],
              ),
            ),
          ),
          if (!isMobile) SizedBox(width: 320, child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: _buildAIPanel(),
          )),
        ],
      ),
    );
  }

  Widget _buildSidebarContent() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          const DrawerHeader(child: Center(child: Text("ResumeCraft", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)))),
          ListTile(leading: const Icon(Icons.home, color: Color(0xFF2D62FF)), title: const Text("Home"), onTap: () {}),
          ListTile(leading: const Icon(Icons.description), title: const Text("Resumes"), onTap: () {}),
          ListTile(leading: const Icon(Icons.work), title: const Text("Jobs"), onTap: () {}),
          ListTile(leading: const Icon(Icons.person), title: const Text("Account"), onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Welcome,", style: TextStyle(fontSize: 24)),
        const Text("Dav A Hunter", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2D62FF), padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14)),
          child: const Text("New Resume", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget _buildRecentResumes(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Recent Resumes", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const Divider(),
        const SizedBox(height: 10),
        // USING WRAP HERE TO PREVENT THE 8.8 PIXEL OVERFLOW
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          runSpacing: 10,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Dav A Hunter", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                Text("Last modified 2 days ago", style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(onPressed: () {}, child: const Text("Edit")),
                TextButton(onPressed: () {}, child: const Text("Duplicate")),
                TextButton(onPressed: () {}, child: const Text("Delete", style: TextStyle(color: Colors.red))),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAIPanel() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10)]),
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            color: const Color(0xFFF0F4FF),
            child: const Icon(Icons.auto_awesome, color: Color(0xFF2D62FF), size: 50),
          ),
          const SizedBox(height: 20),
          const Text("AI Assistant Guidance", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          const Text("Get suggestions for improving your resume as you work on it.", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 14)),
        ],
      ),
    );
  }
}