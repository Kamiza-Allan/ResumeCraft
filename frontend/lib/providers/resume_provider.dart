import 'package:flutter/material.dart';
import '../models/resume.model.dart';

class ResumeProvider with ChangeNotifier {
  Resume? _currentResume;
  String _aiSuggestion = "";

  Resume? get currentResume => _currentResume;
  String get aiSuggestion => _aiSuggestion;

  void updateAISuggestion(String suggestion) {
    _aiSuggestion = suggestion;
    notifyListeners(); // This tells the UI to refresh the AI Panel
  }
}