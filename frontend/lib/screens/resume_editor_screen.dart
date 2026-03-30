import 'package:flutter/material.dart';

class ResumeEditorScreen extends StatefulWidget {
  const ResumeEditorScreen({super.key});

  @override
  State<ResumeEditorScreen> createState() => _ResumeEditorScreenState();
}

class _ResumeEditorScreenState extends State<ResumeEditorScreen> {
  int _currentStep = 0;

  // Controllers to capture input
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _summaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Your Resume", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 2) setState(() => _currentStep += 1);
        },
        onStepCancel: () {
          if (_currentStep > 0) setState(() => _currentStep -= 1);
        },
        steps: [
          Step(
            title: const Text("Basics"),
            isActive: _currentStep >= 0,
            content: Column(
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: "Resume Title (e.g., Software Engineer 2025)"),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _summaryController,
                  maxLines: 3,
                  decoration: const InputDecoration(labelText: "Professional Summary"),
                ),
              ],
            ),
          ),
          Step(
            title: const Text("Experience"),
            isActive: _currentStep >= 1,
            content: const Text("Add your work history here..."),
          ),
          Step(
            title: const Text("Review"),
            isActive: _currentStep >= 2,
            content: const Text("Ready to optimize with AI?"),
          ),
        ],
      ),
    );
  }
}

Future<void> getAISuggestions() async {
  // 1. Show a loading spinner
  // 2. Package the _summaryController.text into JSON
  // 3. Send via HTTP to Django
  // 4. Update the UI with the "Professional Impact" suggestions
}